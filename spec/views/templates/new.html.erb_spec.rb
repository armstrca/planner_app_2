require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      name: "MyString",
      content: "",
      template_type: "MyString",
      is_default: false,
      user: nil,
      planner: nil
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input[name=?]", "template[name]"

      assert_select "input[name=?]", "template[content]"

      assert_select "input[name=?]", "template[template_type]"

      assert_select "input[name=?]", "template[is_default]"

      assert_select "input[name=?]", "template[user_id]"

      assert_select "input[name=?]", "template[planner_id]"
    end
  end
end
