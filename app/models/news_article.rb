class NewsArticle < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :image
  validates :body, :name, presence: true
  paginates_per 5
end