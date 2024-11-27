require 'rails_helper'

RSpec.describe "destinations/show", type: :view do
  before(:each) do
    assign(:destination, Destination.create!(
      title: "Title",
      destination_type: "Destination Type",
      sharepoint_site_url: "Sharepoint Site Url",
      sharepoint_library_name: "Sharepoint Library Name",
      sharepoint_folder_path: "Sharepoint Folder Path",
      created_by_id: "",
      updated_by_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Destination Type/)
    expect(rendered).to match(/Sharepoint Site Url/)
    expect(rendered).to match(/Sharepoint Library Name/)
    expect(rendered).to match(/Sharepoint Folder Path/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
