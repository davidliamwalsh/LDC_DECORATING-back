module Types
  class CareersItemType < Types::BaseObject
    description "A careers item"
    field :id, ID, null: false
    field :title, String, null: false
    field :job_description, String, null: false
    field :job_type, String, null: false
    field :experience, String, null: false
    field :location, String, null: false
    field :drivers_license, String, null: false
    field :language, String, null: false
    field :slug, String, null: false
  end
end