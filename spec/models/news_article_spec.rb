require "rails_helper"

RSpec.describe NewsArticle do

  describe "When creating an news article" do
    it "should call SendEmailCampaign class" do
      create(:news_article)

      expect(SendEmailCampaignJob).to have_enqueued_sidekiq_job
    end
  end
end