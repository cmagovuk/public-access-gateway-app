require 'rails_helper'

RSpec.describe "settings/edit", type: :view do
  let(:setting) {
    Setting.create!(
      key: "MyString",
      value: "MyText"
    )
  }

  before(:each) do
    assign(:setting, setting)
  end

  it "renders the edit setting form" do
    render

    assert_select "form[action=?][method=?]", setting_path(setting), "post" do

      assert_select "input[name=?]", "setting[key]"

      assert_select "textarea[name=?]", "setting[value]"
    end
  end
end
