class Testimonials < ActiveRecord::Migration[6.0]
  def change
    create_table :testimonials do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
