require "rails_helper"

RSpec.describe ResponsePagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/response_pages").to route_to("response_pages#index")
    end

    it "routes to #new" do
      expect(get: "/response_pages/new").to route_to("response_pages#new")
    end

    it "routes to #show" do
      expect(get: "/response_pages/1").to route_to("response_pages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/response_pages/1/edit").to route_to("response_pages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/response_pages").to route_to("response_pages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/response_pages/1").to route_to("response_pages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/response_pages/1").to route_to("response_pages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/response_pages/1").to route_to("response_pages#destroy", id: "1")
    end
  end
end
