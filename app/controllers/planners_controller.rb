class PlannersController < ApplicationController
  def index
    matching_planners = Planner.all

    @list_of_planners = matching_planners.order({ :created_at => :desc })

    render({ :template => "planners/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_planners = Planner.where({ :id => the_id })

    @the_planner = matching_planners.at(0)

    render({ :template => "planners/show" })
  end

  def create
    the_planner = Planner.new
    the_planner.user_id = params.fetch("query_user_id")
    the_planner.monthly_id = params.fetch("query_monthly_id")
    the_planner.weekly_id = params.fetch("query_weekly_id")
    the_planner.daily_id = params.fetch("query_daily_id")
    the_planner.page_order = params.fetch("query_page_order")
    the_planner.monthlies_count = params.fetch("query_monthlies_count")
    the_planner.weeklies_count = params.fetch("query_weeklies_count")
    the_planner.dailies_count = params.fetch("query_dailies_count")
    the_planner.extras_count = params.fetch("query_extras_count")
    the_planner.tldraw_inputs_count = params.fetch("query_tldraw_inputs_count")

    if the_planner.valid?
      the_planner.save
      redirect_to("/planners", { :notice => "Planner created successfully." })
    else
      redirect_to("/planners", { :alert => the_planner.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_planner = Planner.where({ :id => the_id }).at(0)

    the_planner.user_id = params.fetch("query_user_id")
    the_planner.monthly_id = params.fetch("query_monthly_id")
    the_planner.weekly_id = params.fetch("query_weekly_id")
    the_planner.daily_id = params.fetch("query_daily_id")
    the_planner.page_order = params.fetch("query_page_order")
    the_planner.monthlies_count = params.fetch("query_monthlies_count")
    the_planner.weeklies_count = params.fetch("query_weeklies_count")
    the_planner.dailies_count = params.fetch("query_dailies_count")
    the_planner.extras_count = params.fetch("query_extras_count")
    the_planner.tldraw_inputs_count = params.fetch("query_tldraw_inputs_count")

    if the_planner.valid?
      the_planner.save
      redirect_to("/planners/#{the_planner.id}", { :notice => "Planner updated successfully."} )
    else
      redirect_to("/planners/#{the_planner.id}", { :alert => the_planner.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_planner = Planner.where({ :id => the_id }).at(0)

    the_planner.destroy

    redirect_to("/planners", { :notice => "Planner deleted successfully."} )
  end
end
