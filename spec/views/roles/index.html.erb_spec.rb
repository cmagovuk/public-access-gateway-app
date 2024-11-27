require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
    assign(:roles, [
      Role.create!(
        name: "Name",
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
        status: "Status"
      ),
      Role.create!(
        name: "Name",
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
        status: "Status"
      )
    ])
  end

  it "renders a list of roles" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
  end
end
