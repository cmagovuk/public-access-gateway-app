require 'rails_helper'

RSpec.describe "audit_records/show", type: :view do
  before(:each) do
    assign(:audit_record, AuditRecord.create!(
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
