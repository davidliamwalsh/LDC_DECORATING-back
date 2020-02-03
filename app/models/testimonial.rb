class Testimonial < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :body, :name, presence: true
  paginates_per 5
end