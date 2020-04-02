class AddSlugToDecorators < ActiveRecord::Migration[6.0]
  def change
    add_column :decorators, :slug, :string
    add_index :decorators, :slug, unique: true
  end
end
