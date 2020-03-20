class User < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image
  validates :body, :subtitle, :title, :email, presence: true
  paginates_per 10
end