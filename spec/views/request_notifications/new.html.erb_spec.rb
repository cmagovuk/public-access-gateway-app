require 'rails_helper'

RSpec.describe "request_notifications/new", type: :view do
  before(:each) do
    assign(:request_notification, RequestNotification.new(
      request_id: "",
      notification_type: "MyString",
      title: "MyString",
      body: "MyText",
      status: "MyString",
      created_by_id: "",
      updated_by_id: ""
    ))
  end

  it "renders new request_notification form" do
    render

    assert_select "form[action=?][method=?]", request_notifications_path, "post" do

      assert_select "input[name=?]", "request_notification[request_id]"

      assert_select "input[name=?]", "request_notification[notification_type]"

      assert_select "input[name=?]", "request_notification[title]"

      assert_select "textarea[name=?]", "request_notification[body]"

      assert_select "input[name=?]", "request_notification[status]"

      assert_select "input[name=?]", "request_notification[created_by_id]"

      assert_select "input[name=?]", "request_notification[updated_by_id]"
    end
  end
end
