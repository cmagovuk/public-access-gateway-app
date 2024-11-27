require "rails_helper"

RSpec.describe ResponseNotificationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/response_notifications").to route_to("response_notifications#index")
    end

    it "routes to #new" do
      expect(get: "/response_notifications/new").to route_to("response_notifications#new")
    end

    it "routes to #show" do
      expect(get: "/response_notifications/1").to route_to("response_notifications#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/response_notifications/1/edit").to route_to("response_notifications#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/response_notifications").to route_to("response_notifications#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/response_notifications/1").to route_to("response_notifications#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/response_notifications/1").to route_to("response_notifications#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/response_notifications/1").to route_to("response_notifications#destroy", id: "1")
    end
  end
end
