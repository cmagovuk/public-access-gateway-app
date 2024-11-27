require 'rails_helper'

RSpec.describe "response_pages/new", type: :view do
  before(:each) do
    assign(:response_page, ResponsePage.new)
  end

  it "renders new response_page form" do
    render

    assert_select "form[action=?][method=?]", response_pages_path, "post" do
    end
  end
end
