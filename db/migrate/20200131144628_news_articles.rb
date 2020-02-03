class NewsArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :news_articles do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
