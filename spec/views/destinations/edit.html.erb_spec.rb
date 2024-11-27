require 'rails_helper'

RSpec.describe "destinations/edit", type: :view do
  let(:destination) {
    Destination.create!(
      title: "MyString",
      destination_type: "MyString",
      sharepoint_site_url: "MyString",
      sharepoint_library_name: "MyString",
      sharepoint_folder_path: "MyString",
      created_by_id: "",
      updated_by_id: ""
    )
  }

  before(:each) do
    assign(:destination, destination)
  end

  it "renders the edit destination form" do
    render

    assert_select "form[action=?][method=?]", destination_path(destination), "post" do

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
