class Testimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
