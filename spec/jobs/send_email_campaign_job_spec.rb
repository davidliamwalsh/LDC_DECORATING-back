require "rails_helper"

RSpec.describe SendEmailCampaignJob do 
  describe "Calling the worker", sidekiq: :inline do
    it "should call the email campaign service class" do
      allow(SendEmailCampaign).to receive(:call)

      SendEmailCampaignJob.perform_async

      expect(SendEmailCampaign).to have_received(:call)
    end
  end
end