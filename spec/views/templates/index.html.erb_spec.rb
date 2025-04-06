require 'rails_helper'

RSpec.describe "templates/index", type: :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        name: "Name",
        content: "",
        template_type: "Template Type",
        is_default: false,
        user: nil,
        planner: nil
      ),
      Template.create!(
        name: "Name",
        content: "",
        template_type: "Template Type",
        is_default: false,
        user: nil,
        planner: nil
      )
    ])
  end

  it "renders a list of templates" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Template Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
