require 'rails_helper'

RSpec.describe "response_notifications/show", type: :view do
  before(:each) do
    assign(:response_notification, ResponseNotification.create!(
      request_id: "",
      response_id: "",
      title: "Title",
      body: "MyText",
      status: "Status",
      created_by_id: "",
      updated_by_id: "",
      request_notification_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
