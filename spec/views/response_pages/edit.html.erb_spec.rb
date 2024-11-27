require 'rails_helper'

RSpec.describe "response_pages/edit", type: :view do
  let(:response_page) do
    ResponsePage.create!
  end

  before(:each) do
    assign(:response_page, response_page)
  end

  it "renders the edit response_page form" do
    render

    assert_select "form[action=?][method=?]", response_page_path(response_page), "post" do
    end
  end
end
