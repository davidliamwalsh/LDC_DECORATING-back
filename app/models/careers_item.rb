class CareersItem < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :job_description, :title, presence: true
  paginates_per 10

end