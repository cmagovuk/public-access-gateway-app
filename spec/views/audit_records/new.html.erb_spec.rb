require 'rails_helper'

RSpec.describe "audit_records/new", type: :view do
  before(:each) do
    assign(:audit_record, AuditRecord.new(
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
    ))
  end

  it "renders new audit_record form" do
    render

    assert_select "form[action=?][method=?]", audit_records_path, "post" do

      assert_select "input[name=?]", "audit_record[request_id]"

      assert_select "input[name=?]", "audit_record[request_page_id]"

      assert_select "input[name=?]", "audit_record[request_route_id]"

      assert_select "input[name=?]", "audit_record[request_route_clause_id]"

      assert_select "input[name=?]", "audit_record[request_question_id]"

      assert_select "input[name=?]", "audit_record[request_rule_id]"

      assert_select "input[name=?]", "audit_record[role_id]"

      assert_select "input[name=?]", "audit_record[user_role]"

      assert_select "input[name=?]", "audit_record[user_id]"

      assert_select "textarea[name=?]", "audit_record[narrative]"

      assert_select "input[name=?]", "audit_record[created_by]"

      assert_select "input[name=?]", "audit_record[updated_by]"
    end
  end
end
