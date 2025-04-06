require 'rails_helper'

RSpec.describe "templates/show", type: :view do
  before(:each) do
    assign(:template, Template.create!(
      name: "Name",
      content: "",
      template_type: "Template Type",
      is_default: false,
      user: nil,
      planner: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Template Type/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
