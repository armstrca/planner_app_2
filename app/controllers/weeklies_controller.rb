class WeekliesController < ApplicationController
  def index
    matching_weeklies = Weekly.all

    @list_of_weeklies = matching_weeklies.order({ :created_at => :desc })

    render({ :template => "weeklies/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_weeklies = Weekly.where({ :id => the_id })

    @the_weekly = matching_weeklies.at(0)

    render({ :template => "weeklies/show" })
  end

  def create
    the_weekly = Weekly.new
    the_weekly.planner_id = params.fetch("query_planner_id")
    the_weekly.html = params.fetch("query_html")

    if the_weekly.valid?
      the_weekly.save
      redirect_to("/weeklies", { :notice => "Weekly created successfully." })
    else
      redirect_to("/weeklies", { :alert => the_weekly.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_weekly = Weekly.where({ :id => the_id }).at(0)

    the_weekly.planner_id = params.fetch("query_planner_id")
    the_weekly.html = params.fetch("query_html")

    if the_weekly.valid?
      the_weekly.save
      redirect_to("/weeklies/#{the_weekly.id}", { :notice => "Weekly updated successfully."} )
    else
      redirect_to("/weeklies/#{the_weekly.id}", { :alert => the_weekly.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_weekly = Weekly.where({ :id => the_id }).at(0)

    the_weekly.destroy

    redirect_to("/weeklies", { :notice => "Weekly deleted successfully."} )
  end
end
