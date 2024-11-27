require 'rails_helper'

RSpec.describe "audit_records/index", type: :view do
  before(:each) do
    assign(:audit_records, [
      AuditRecord.create!(
        request_id: "",
        request_page_id: "",
        request_route_id: "",
        request_route_clause_id: "",
        request_question_id: "",
        request_rule_id: "",
        role_id: "",
        user_role: "",
        user_id: "",
        narrative: "MyText",
        created_by: "",
        updated_by: ""
      ),
      AuditRecord.create!(
        request_id: "",
        request_page_id: "",
        request_route_id: "",
        request_route_clause_id: "",
        request_question_id: "",
        request_rule_id: "",
        role_id: "",
        user_role: "",
        user_id: "",
        narrative: "MyText",
        created_by: "",
        updated_by: ""
      )
    ])
  end

  it "renders a list of audit_records" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
