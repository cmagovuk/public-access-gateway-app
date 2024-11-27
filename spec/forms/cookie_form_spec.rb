require "rails_helper"

describe CookieForm do
  subject(:form) { described_class.new }

  it "has been instantiated" do
    expect(form).to be_an(CookieForm)
  end
  describe "analytics=" do
    it "stores the value" do
      form.analytics = true
      expect(form.analytics).to be true
    end
  end
end