class Decorator < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :body, :subtitle, :title, :email, presence: true
  after_create :send_email_campaign
  has_one_attached :image
  paginates_per 10

  def send_email_campaign
    SendEmailCampaignJob.perform_async
  end
end