require 'rails_helper'

RSpec.describe "response_notifications/edit", type: :view do
  let(:response_notification) {
    ResponseNotification.create!(
      request_id: "",
      response_id: "",
      title: "MyString",
      body: "MyText",
      status: "MyString",
      created_by_id: "",
      updated_by_id: "",
      request_notification_id: ""
    )
  }

  before(:each) do
    assign(:response_notification, response_notification)
  end

  it "renders the edit response_notification form" do
    render

    assert_select "form[action=?][method=?]", response_notification_path(response_notification), "post" do

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
