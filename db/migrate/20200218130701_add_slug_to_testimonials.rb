class AddSlugToTestimonials < ActiveRecord::Migration[6.0]
  def change
    add_column :testimonials, :slug, :string
    add_index :testimonials, :slug, unique: true
  end
end
