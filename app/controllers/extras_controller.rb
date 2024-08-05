# frozen_string_literal: true

class ExtrasController < ApplicationController
  def index
    matching_extras = Extra.all

    @list_of_extras = matching_extras.order({ created_at: :desc })

    render({ template: 'extras/index' })
  end

  def show
    the_id = params.fetch('path_id')

    matching_extras = Extra.where({ id: the_id })

    @the_extra = matching_extras.at(0)

    render({ template: 'extras/show' })
  end

  def create
    the_extra = Extra.new
    the_extra.planner_id = params.fetch('query_planner_id')
    the_extra.html = params.fetch('query_html')

    if the_extra.valid?
      the_extra.save
      redirect_to('/extras', { notice: 'Extra created successfully.' })
    else
      redirect_to('/extras', { alert: the_extra.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch('path_id')
    the_extra = Extra.where({ id: the_id }).at(0)

    the_extra.planner_id = params.fetch('query_planner_id')
    the_extra.html = params.fetch('query_html')

    if the_extra.valid?
      the_extra.save
      redirect_to("/extras/#{the_extra.id}", { notice: 'Extra updated successfully.' })
    else
      redirect_to("/extras/#{the_extra.id}", { alert: the_extra.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch('path_id')
    the_extra = Extra.where({ id: the_id }).at(0)

    the_extra.destroy

    redirect_to('/extras', { notice: 'Extra deleted successfully.' })
  end
end
