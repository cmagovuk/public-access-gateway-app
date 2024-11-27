require 'rails_helper'

RSpec.describe "request_notifications/edit", type: :view do
  let(:request_notification) {
    RequestNotification.create!(
      request_id: "",
      notification_type: "MyString",
      title: "MyString",
      body: "MyText",
      status: "MyString",
      created_by_id: "",
      updated_by_id: ""
    )
  }

  before(:each) do
    assign(:request_notification, request_notification)
  end

  it "renders the edit request_notification form" do
    render

    assert_select "form[action=?][method=?]", request_notification_path(request_notification), "post" do

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
