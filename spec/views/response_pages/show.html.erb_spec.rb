require 'rails_helper'

RSpec.describe "response_pages/show", type: :view do
  before(:each) do
    assign(:response_page, ResponsePage.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
