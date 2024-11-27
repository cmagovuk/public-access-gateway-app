require 'rails_helper'

RSpec.describe "user_roles/edit", type: :view do
  let(:user_role) do
    UserRole.create!(
      user_id: "",
      role_id: ""
    )
  end

  before(:each) do
    assign(:user_role, user_role)
  end

  it "renders the edit user_role form" do
    render

    assert_select "form[action=?][method=?]", user_role_path(user_role), "post" do

      assert_select "input[name=?]", "user_role[user_id]"

      assert_select "input[name=?]", "user_role[role_id]"
    end
  end
end
