require "rails_helper"

# Specs in this file have access to a helper object that includes
# the ReportIssueHelper. For example:
#
# describe ReportIssueHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "#analytics_tracking_id" do
    it "retrieves the value from the application configuration" do
      expect(Rails.application.config.x).to receive(:analytics_tracking_id)
      helper.analytics_tracking_id
    end
  end

  describe "#title" do
    let(:title) { helper.content_for(:page_title) }

    before do
      helper.title(value)
    end

    context "for a blank value" do
      let(:value) { "" }
      it { expect(title).to eq("CMA Public Gateway - GOV.UK") }
    end

    context "for a given page" do
      let(:value) { "Test Page" }
      it { expect(title).to eq("Test Page - CMA Public Gateway - GOV.UK") }
    end
  end

  describe "#feedback_link" do
    context "When a feedback email is configured" do
      before do
        allow(Rails.application.config.x).to receive(:feedback_email).and_return("test@example.com")
      end
      it "returns mailto link" do
        expect(helper.feedback_link("LINK TEST")).to match(/\A<a( class=".*")? href="mailto:.*">LINK TEST<\/a>\z/)
      end
    end

    context "When not feedback email is configured" do
      before do
        allow(Rails.application.config.x).to receive(:feedback_email).and_return("")
      end
      it "returns mailto link" do
        expect(helper.feedback_link("LINK TEST")).to eq("LINK TEST")
      end
    end
  end
end
