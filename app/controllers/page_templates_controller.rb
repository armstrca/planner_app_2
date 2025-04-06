class PageTemplatesController < ApplicationController
  before_action :set_page_template, only: %i[ show edit update destroy ]

  def index
    @page_templates = PageTemplate.all
    render json: @page_templates
  end

  def show
    @page_template = PageTemplate.find(params[:id])
    render json: @page_template
  end

  def new

  end

  def create
    @page_template = PageTemplate.new(page_template_params)

    if @page_template.save
      render json: @page_template, status: :created
    else
      render json: { errors: @page_template.errors }, status: :unprocessable_entity
    end
  end

  private

  def page_template_params
    params.require(:page_template).permit(:title, :content)
  end
end