require 'rails_helper'

RSpec.describe "destinations/index", type: :view do
  before(:each) do
    assign(:destinations, [
      Destination.create!(
        title: "Title",
        destination_type: "Destination Type",
        sharepoint_site_url: "Sharepoint Site Url",
        sharepoint_library_name: "Sharepoint Library Name",
        sharepoint_folder_path: "Sharepoint Folder Path",
        created_by_id: "",
        updated_by_id: ""
      ),
      Destination.create!(
        title: "Title",
        destination_type: "Destination Type",
        sharepoint_site_url: "Sharepoint Site Url",
        sharepoint_library_name: "Sharepoint Library Name",
        sharepoint_folder_path: "Sharepoint Folder Path",
        created_by_id: "",
        updated_by_id: ""
      )
    ])
  end

  it "renders a list of destinations" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Destination Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sharepoint Site Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sharepoint Library Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Sharepoint Folder Path".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
