module Types
  class DecoratorType < Types::BaseObject
    description "A decorator"
    field :id, ID, null: false
    field :image, String, null: false
    field :title, String, null: false
    field :subtitle, String, null: false
    field :body, String, null: false
    field :preview_image, String, null: false
    field :email, String, null: false
    field :linkedin, String, null: false
    field :slug, String, null: false

    def image
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    end

    def preview_image
      Rails.application.routes.url_helpers.polymorphic_url(object.image.variant(resize: '500x333'), only_path: true)
      Rails.application.routes.url_helpers.rails_blob_path(object.image, only_path: true)
    end
  end
end