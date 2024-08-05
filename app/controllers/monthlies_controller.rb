# frozen_string_literal: true

class MonthliesController < ApplicationController
  def index
    matching_monthlies = Monthly.all

    @list_of_monthlies = matching_monthlies.order({ created_at: :desc })

    render({ template: 'monthlies/index' })
  end

  def show
    the_id = params.fetch('path_id')

    matching_monthlies = Monthly.where({ id: the_id })

    @the_monthly = matching_monthlies.at(0)

    render({ template: 'monthlies/show' })
  end

  def create
    the_monthly = Monthly.new
    the_monthly.planner_id = params.fetch('query_planner_id')
    the_monthly.html = params.fetch('query_html')

    if the_monthly.valid?
      the_monthly.save
      redirect_to('/monthlies', { notice: 'Monthly created successfully.' })
    else
      redirect_to('/monthlies', { alert: the_monthly.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch('path_id')
    the_monthly = Monthly.where({ id: the_id }).at(0)

    the_monthly.planner_id = params.fetch('query_planner_id')
    the_monthly.html = params.fetch('query_html')

    if the_monthly.valid?
      the_monthly.save
      redirect_to("/monthlies/#{the_monthly.id}", { notice: 'Monthly updated successfully.' })
    else
      redirect_to("/monthlies/#{the_monthly.id}", { alert: the_monthly.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch('path_id')
    the_monthly = Monthly.where({ id: the_id }).at(0)

    the_monthly.destroy

    redirect_to('/monthlies', { notice: 'Monthly deleted successfully.' })
  end
end
