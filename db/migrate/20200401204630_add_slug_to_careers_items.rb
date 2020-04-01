class AddSlugToCareersItems < ActiveRecord::Migration[6.0]
  def change
    add_column :careers_items, :slug, :string
    add_index :careers_items, :slug, unique: true
  end
end
