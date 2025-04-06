class WeeklyController < ApplicationController
  def index; end

  def show
    week_year = params[:id].split('_')
    @week_number = week_year[0].to_i
    @year = week_year[1].to_i

    @full_week_dates = (1..7).map { |d| Date.commercial(@year, @week_number, d) }

    # Split into main page (Mon-Sat) and Sunday
    @main_dates = @full_week_dates[0..5] # Monday-Saturday
    @sunday_date = @full_week_dates[6] # Sunday
    @display_month_year = @main_dates.first.strftime('%B %Y')
    @holidays = load_holidays_for_dates(@main_dates)
    @moon_phases = load_moon_phases(@main_dates)
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def load_holidays_for_dates(dates)
    Holidays.between(dates.first, dates.last, :us, :observed)
            .each_with_object({}) do |holiday, hash|
      hash[holiday[:date]] = holiday[:name] if dates.include?(holiday[:date])
    end
  end

  def load_moon_phases(dates)
    previous_date = dates.first - 1.day
    previous_phase = moon_phase_category(SunCalc.moon_illumination(previous_date.to_time)[:phase])

    dates.each_with_object({}) do |date, hash|
      moon_data = SunCalc.moon_illumination(date.to_time)
      current_phase = moon_phase_category(moon_data[:phase])

      if current_phase != previous_phase
        phase_name = moon_phase_name(current_phase)
        hash[date] = {
          emoji: current_phase,
          alt: "Moon phase: #{phase_name}",
          aria_label: "Moon phase: #{phase_name}"
        }
      else
        hash[date] = {
          emoji: '',
          alt: '',
          aria_label: ''
        }
      end

      previous_phase = current_phase
    end
  end

  def moon_phase_category(phase)
    case phase
    when 0.0...0.125 then '🌑'
    when 0.125...0.25 then '🌒'
    when 0.25...0.375 then '🌓'
    when 0.375...0.5 then '🌔'
    when 0.5...0.625 then '🌕'
    when 0.625...0.75 then '🌖'
    when 0.75...0.825 then '🌗'
    when 0.825...1.0 then '🌘'
    end
  end

  def moon_phase_name(emoji)
    {
      '🌑' => 'New Moon',
      '🌒' => 'Waxing Crescent',
      '🌓' => 'First Quarter',
      '🌔' => 'Waxing Gibbous',
      '🌕' => 'Full Moon',
      '🌖' => 'Waning Gibbous',
      '🌗' => 'Last Quarter',
      '🌘' => 'Waning Crescent'
    }[emoji] || ''
  end
end