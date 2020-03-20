class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :title, null: false
      t.string :subtitle, null: false
      t.string :body, null: false
      t.string :email, null: false
      t.string :linkedin, null: false
    end
  end
end
