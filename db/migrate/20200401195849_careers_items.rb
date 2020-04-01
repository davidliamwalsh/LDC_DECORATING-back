class CareersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :careers_items do |t|
      t.string :title, null: false
      t.string :job_description, null: false
      t.string :job_type, null: false
      t.string :experience, null: false
      t.string :location, null: false
      t.string :drivers_license, null: false
      t.string :language, null: false
    end
  end
end
