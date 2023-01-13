require "rails_helper"

RSpec.describe "Errors", type: :request do
  describe "GET errors#not_found" do
    it "returns not found" do
      get "/404"
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "GET errors#unprocessable_entity" do
    it "returns unprocessable entity" do
      get "/422"
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET errors#internal_server_error" do
    it "returns internal server error" do
      get "/500"
      expect(response).to have_http_status(:internal_server_error)
    end
  end

  describe "GET errors#service_unavailable" do
    it "returns service unavailable" do
      get "/503"
      expect(response).to have_http_status(:service_unavailable)
    end
  end
end
