require 'rails_helper'

RSpec.describe "response_notifications/index", type: :view do
  before(:each) do
    assign(:response_notifications, [
      ResponseNotification.create!(
        request_id: "",
        response_id: "",
        title: "Title",
        body: "MyText",
        status: "Status",
        created_by_id: "",
        updated_by_id: "",
        request_notification_id: ""
      ),
      ResponseNotification.create!(
        request_id: "",
        response_id: "",
        title: "Title",
        body: "MyText",
        status: "Status",
        created_by_id: "",
        updated_by_id: "",
        request_notification_id: ""
      )
    ])
  end

  it "renders a list of response_notifications" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Status".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
