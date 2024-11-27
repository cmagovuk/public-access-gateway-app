require "rails_helper"

RSpec.describe CookiesController do
  context "when no maintenance" do
    before do
      allow(controller).to receive(:maintenance_text).and_return("")
    end
    describe "#edit" do
      it "renders the correct page" do
        get :edit
        expect(response).to render_template(:edit)
      end
    end

    describe "#create" do
      it "redirects to the correct place" do
        post :create, params: { cookie: { usage: true, return_path: "/test" } }
        expect(response).to redirect_to("/test")
      end
    end

    describe "#update" do
      it "redirects to the correct place" do
        patch :update, params: { cookie: { usage: true } }
        expect(response).to redirect_to("/about/cookies")
      end
    end
  end
end