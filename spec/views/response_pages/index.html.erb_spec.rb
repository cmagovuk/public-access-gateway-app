require 'rails_helper'

RSpec.describe "response_pages/index", type: :view do
  before(:each) do
    assign(:response_pages, [
      ResponsePage.create!,
      ResponsePage.create!
    ])
  end

  it "renders a list of response_pages" do
    render
    Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
