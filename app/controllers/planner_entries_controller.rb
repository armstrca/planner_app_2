class PlannerEntriesController < ApplicationController
  def index
    matching_planner_entries = PlannerEntry.all

    @list_of_planner_entries = matching_planner_entries.order({ :created_at => :desc })

    render({ :template => "planner_entries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_planner_entries = PlannerEntry.where({ :id => the_id })

    @the_planner_entry = matching_planner_entries.at(0)

    render({ :template => "planner_entries/show" })
  end

  def create
    the_planner_entry = PlannerEntry.new
    the_planner_entry.user_id = params.fetch("query_user_id")
    the_planner_entry.planner_id = params.fetch("query_planner_id")
    the_planner_entry.datetime_start = params.fetch("query_datetime_start")
    the_planner_entry.tldraw_input_id = params.fetch("query_tldraw_input_id")
    the_planner_entry.monthly_id = params.fetch("query_monthly_id")
    the_planner_entry.daily_id = params.fetch("query_daily_id")
    the_planner_entry.weekly_id = params.fetch("query_weekly_id")
    the_planner_entry.extra_id = params.fetch("query_extra_id")
    the_planner_entry.entry_content = params.fetch("query_entry_content")
    the_planner_entry.location = params.fetch("query_location")
    the_planner_entry.datetime_end = params.fetch("query_datetime_end")

    if the_planner_entry.valid?
      the_planner_entry.save
      redirect_to("/planner_entries", { :notice => "Planner entry created successfully." })
    else
      redirect_to("/planner_entries", { :alert => the_planner_entry.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_planner_entry = PlannerEntry.where({ :id => the_id }).at(0)

    the_planner_entry.user_id = params.fetch("query_user_id")
    the_planner_entry.planner_id = params.fetch("query_planner_id")
    the_planner_entry.datetime_start = params.fetch("query_datetime_start")
    the_planner_entry.tldraw_input_id = params.fetch("query_tldraw_input_id")
    the_planner_entry.monthly_id = params.fetch("query_monthly_id")
    the_planner_entry.daily_id = params.fetch("query_daily_id")
    the_planner_entry.weekly_id = params.fetch("query_weekly_id")
    the_planner_entry.extra_id = params.fetch("query_extra_id")
    the_planner_entry.entry_content = params.fetch("query_entry_content")
    the_planner_entry.location = params.fetch("query_location")
    the_planner_entry.datetime_end = params.fetch("query_datetime_end")

    if the_planner_entry.valid?
      the_planner_entry.save
      redirect_to("/planner_entries/#{the_planner_entry.id}", { :notice => "Planner entry updated successfully."} )
    else
      redirect_to("/planner_entries/#{the_planner_entry.id}", { :alert => the_planner_entry.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_planner_entry = PlannerEntry.where({ :id => the_id }).at(0)

    the_planner_entry.destroy

    redirect_to("/planner_entries", { :notice => "Planner entry deleted successfully."} )
  end
end
