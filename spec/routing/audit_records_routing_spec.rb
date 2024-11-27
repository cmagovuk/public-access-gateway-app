require "rails_helper"

RSpec.describe AuditRecordsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/audit_records").to route_to("audit_records#index")
    end

    it "routes to #new" do
      expect(get: "/audit_records/new").to route_to("audit_records#new")
    end

    it "routes to #show" do
      expect(get: "/audit_records/1").to route_to("audit_records#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/audit_records/1/edit").to route_to("audit_records#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/audit_records").to route_to("audit_records#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/audit_records/1").to route_to("audit_records#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/audit_records/1").to route_to("audit_records#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/audit_records/1").to route_to("audit_records#destroy", id: "1")
    end
  end
end
