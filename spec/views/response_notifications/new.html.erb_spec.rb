require 'rails_helper'

RSpec.describe "response_notifications/new", type: :view do
  before(:each) do
    assign(:response_notification, ResponseNotification.new(
      request_id: "",
      response_id: "",
      title: "MyString",
      body: "MyText",
      status: "MyString",
      created_by_id: "",
      updated_by_id: "",
      request_notification_id: ""
    ))
  end

  it "renders new response_notification form" do
    render

    assert_select "form[action=?][method=?]", response_notifications_path, "post" do

      assert_select "input[name=?]", "response_notification[request_id]"

      assert_select "input[name=?]", "response_notification[response_id]"

      assert_select "input[name=?]", "response_notification[title]"

      assert_select "textarea[name=?]", "response_notification[body]"

      assert_select "input[name=?]", "response_notification[status]"

      assert_select "input[name=?]", "response_notification[created_by_id]"

      assert_select "input[name=?]", "response_notification[updated_by_id]"

      assert_select "input[name=?]", "response_notification[request_notification_id]"
    end
  end
end
