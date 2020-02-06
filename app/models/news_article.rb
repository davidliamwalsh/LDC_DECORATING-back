class NewsArticle < ApplicationRecord
  has_one_attached :image
  validates :body, :title, presence: true
  paginates_per 5
end