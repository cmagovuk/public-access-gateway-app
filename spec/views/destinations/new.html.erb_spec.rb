require 'rails_helper'

RSpec.describe "destinations/new", type: :view do
  before(:each) do
    assign(:destination, Destination.new(
      title: "MyString",
      destination_type: "MyString",
      sharepoint_site_url: "MyString",
      sharepoint_library_name: "MyString",
      sharepoint_folder_path: "MyString",
      created_by_id: "",
      updated_by_id: ""
    ))
  end

  it "renders new destination form" do
    render

    assert_select "form[action=?][method=?]", destinations_path, "post" do

      assert_select "input[name=?]", "destination[title]"

      assert_select "input[name=?]", "destination[destination_type]"

      assert_select "input[name=?]", "destination[sharepoint_site_url]"

      assert_select "input[name=?]", "destination[sharepoint_library_name]"

      assert_select "input[name=?]", "destination[sharepoint_folder_path]"

      assert_select "input[name=?]", "destination[created_by_id]"

      assert_select "input[name=?]", "destination[updated_by_id]"
    end
  end
end
