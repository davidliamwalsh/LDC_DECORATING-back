class NewsArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :news_articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps
    end
  end
end
