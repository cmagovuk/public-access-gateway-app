require 'rails_helper'

RSpec.describe "request_notifications/show", type: :view do
  before(:each) do
    assign(:request_notification, RequestNotification.create!(
      request_id: "",
      notification_type: "Notification Type",
      title: "Title",
      body: "MyText",
      status: "Status",
      created_by_id: "",
      updated_by_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Notification Type/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
