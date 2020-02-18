class Testimonial < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image
  validates :body, :title, presence: true
  paginates_per 5
end