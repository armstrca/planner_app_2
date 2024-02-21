class DailiesController < ApplicationController
  def index
    matching_dailies = Daily.all

    @list_of_dailies = matching_dailies.order({ :created_at => :desc })

    render({ :template => "dailies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_dailies = Daily.where({ :id => the_id })

    @the_daily = matching_dailies.at(0)

    render({ :template => "dailies/show" })
  end

  def create
    the_daily = Daily.new
    the_daily.planner_id = params.fetch("query_planner_id")
    the_daily.html = params.fetch("query_html")

    if the_daily.valid?
      the_daily.save
      redirect_to("/dailies", { :notice => "Daily created successfully." })
    else
      redirect_to("/dailies", { :alert => the_daily.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_daily = Daily.where({ :id => the_id }).at(0)

    the_daily.planner_id = params.fetch("query_planner_id")
    the_daily.html = params.fetch("query_html")

    if the_daily.valid?
      the_daily.save
      redirect_to("/dailies/#{the_daily.id}", { :notice => "Daily updated successfully."} )
    else
      redirect_to("/dailies/#{the_daily.id}", { :alert => the_daily.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_daily = Daily.where({ :id => the_id }).at(0)

    the_daily.destroy

    redirect_to("/dailies", { :notice => "Daily deleted successfully."} )
  end
end
