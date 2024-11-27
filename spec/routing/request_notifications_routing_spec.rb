require "rails_helper"

RSpec.describe RequestNotificationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/request_notifications").to route_to("request_notifications#index")
    end

    it "routes to #new" do
      expect(get: "/request_notifications/new").to route_to("request_notifications#new")
    end

    it "routes to #show" do
      expect(get: "/request_notifications/1").to route_to("request_notifications#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/request_notifications/1/edit").to route_to("request_notifications#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/request_notifications").to route_to("request_notifications#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/request_notifications/1").to route_to("request_notifications#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/request_notifications/1").to route_to("request_notifications#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/request_notifications/1").to route_to("request_notifications#destroy", id: "1")
    end
  end
end
