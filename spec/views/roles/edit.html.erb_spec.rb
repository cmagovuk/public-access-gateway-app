require 'rails_helper'

RSpec.describe "roles/edit", type: :view do
  let(:role) do
    Role.create!(
      name: "MyString",
      request_create: false,
      request_read: false,
      request_update: false,
      request_destroy: false,
      request_manage: false,
      request_page_create: false,
      request_page_read: false,
      request_page_update: false,
      request_page_destroy: false,
      request_route_create: false,
      request_route_read: false,
      request_route_update: false,
      request_route_destroy: false,
      request_question_create: false,
      request_question_read: false,
      request_question_update: false,
      request_question_destroy: false,
      request_rule_create: false,
      request_rule_read: false,
      request_rule_update: false,
      request_rule_destroy: false,
      template_page_create: false,
      template_page_read: false,
      template_page_update: false,
      template_page_destroy: false,
      template_question_create: false,
      template_question_read: false,
      template_question_update: false,
      template_question_destroy: false,
      template_rule_create: false,
      template_rule_read: false,
      template_rule_update: false,
      template_rule_destroy: false,
      status: "MyString"
    )
  end

  before(:each) do
    assign(:role, role)
  end

  it "renders the edit role form" do
    render

    assert_select "form[action=?][method=?]", role_path(role), "post" do

      assert_select "input[name=?]", "role[name]"

      assert_select "input[name=?]", "role[request_create]"

      assert_select "input[name=?]", "role[request_read]"

      assert_select "input[name=?]", "role[request_update]"

      assert_select "input[name=?]", "role[request_destroy]"

      assert_select "input[name=?]", "role[request_manage]"

      assert_select "input[name=?]", "role[request_page_create]"

      assert_select "input[name=?]", "role[request_page_read]"

      assert_select "input[name=?]", "role[request_page_update]"

      assert_select "input[name=?]", "role[request_page_destroy]"

      assert_select "input[name=?]", "role[request_route_create]"

      assert_select "input[name=?]", "role[request_route_read]"

      assert_select "input[name=?]", "role[request_route_update]"

      assert_select "input[name=?]", "role[request_route_destroy]"

      assert_select "input[name=?]", "role[request_question_create]"

      assert_select "input[name=?]", "role[request_question_read]"

      assert_select "input[name=?]", "role[request_question_update]"

      assert_select "input[name=?]", "role[request_question_destroy]"

      assert_select "input[name=?]", "role[request_rule_create]"

      assert_select "input[name=?]", "role[request_rule_read]"

      assert_select "input[name=?]", "role[request_rule_update]"

      assert_select "input[name=?]", "role[request_rule_destroy]"

      assert_select "input[name=?]", "role[template_page_create]"

      assert_select "input[name=?]", "role[template_page_read]"

      assert_select "input[name=?]", "role[template_page_update]"

      assert_select "input[name=?]", "role[template_page_destroy]"

      assert_select "input[name=?]", "role[template_question_create]"

      assert_select "input[name=?]", "role[template_question_read]"

      assert_select "input[name=?]", "role[template_question_update]"

      assert_select "input[name=?]", "role[template_question_destroy]"

      assert_select "input[name=?]", "role[template_rule_create]"

      assert_select "input[name=?]", "role[template_rule_read]"

      assert_select "input[name=?]", "role[template_rule_update]"

      assert_select "input[name=?]", "role[template_rule_destroy]"

      assert_select "input[name=?]", "role[status]"
    end
  end
end
