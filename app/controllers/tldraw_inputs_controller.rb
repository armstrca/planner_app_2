# frozen_string_literal: true

class TldrawInputsController < ApplicationController
  def index
    matching_tldraw_inputs = TldrawInput.all

    @list_of_tldraw_inputs = matching_tldraw_inputs.order({ created_at: :desc })

    render({ template: 'tldraw_inputs/index' })
  end

  def show
    the_id = params.fetch('path_id')

    matching_tldraw_inputs = TldrawInput.where({ id: the_id })

    @the_tldraw_input = matching_tldraw_inputs.at(0)

    render({ template: 'tldraw_inputs/show' })
  end

  def create
    the_tldraw_input = TldrawInput.new
    the_tldraw_input.user_id = params.fetch('query_user_id')
    the_tldraw_input.planner_id = params.fetch('query_planner_id')

    if the_tldraw_input.valid?
      the_tldraw_input.save
      redirect_to('/tldraw_inputs', { notice: 'Tldraw input created successfully.' })
    else
      redirect_to('/tldraw_inputs', { alert: the_tldraw_input.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch('path_id')
    the_tldraw_input = TldrawInput.where({ id: the_id }).at(0)

    the_tldraw_input.user_id = params.fetch('query_user_id')
    the_tldraw_input.planner_id = params.fetch('query_planner_id')

    if the_tldraw_input.valid?
      the_tldraw_input.save
      redirect_to("/tldraw_inputs/#{the_tldraw_input.id}", { notice: 'Tldraw input updated successfully.' })
    else
      redirect_to("/tldraw_inputs/#{the_tldraw_input.id}",
                  { alert: the_tldraw_input.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch('path_id')
    the_tldraw_input = TldrawInput.where({ id: the_id }).at(0)

    the_tldraw_input.destroy

    redirect_to('/tldraw_inputs', { notice: 'Tldraw input deleted successfully.' })
  end
end
