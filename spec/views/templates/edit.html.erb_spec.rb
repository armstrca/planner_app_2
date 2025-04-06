require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  let(:template) {
    Template.create!(
      name: "MyString",
      content: "",
      template_type: "MyString",
      is_default: false,
      user: nil,
      planner: nil
    )
  }

  before(:each) do
    assign(:template, template)
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(template), "post" do

      assert_select "input[name=?]", "template[name]"

      assert_select "input[name=?]", "template[content]"

      assert_select "input[name=?]", "template[template_type]"

      assert_select "input[name=?]", "template[is_default]"

      assert_select "input[name=?]", "template[user_id]"

      assert_select "input[name=?]", "template[planner_id]"
    end
  end
end
