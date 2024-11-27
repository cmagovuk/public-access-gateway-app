require 'rails_helper'

RSpec.describe "request_notifications/index", type: :view do
  before(:each) do
    assign(:request_notifications, [
      RequestNotification.create!(
        request_id: "",
        notification_type: "Notification Type",
        title: "Title",
        body: "MyText",
        status: "Status",
        created_by_id: "",
        updated_by_id: ""
      ),
      RequestNotification.create!(
        request_id: "",
        notification_type: "Notification Type",
        title: "Title",
        body: "MyText",
        status: "Status",
        created_by_id: "",
        updated_by_id: ""
      )
    ])
  end

  it "renders a list of request_notifications" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Notification Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
