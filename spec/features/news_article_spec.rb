require "rails_helper"

RSpec.describe "News Articles", type: :feature do
  include BasicAuthHelper

  before(:each) do
    log_in
  end

  context "creating a news article" do

    describe "viewing all news articles" do
      it "should show a list of news articles" do
        visit admin_news_articles_path

        create_list(:news_article, 5)
      
        expect(page).to have_content(@news_articles)
      end
    end

    describe "with valid data" do
      it "should create a news article" do
        visit new_admin_news_article_path

        fill_in 'Title', with: 'My Title'
        fill_in 'Body', with: 'some text'

        click_on 'Submit'
        
        expect(page).to have_content("My Title")
      end
    end

    describe "with invalid data" do
      it "should raise an error" do
        visit new_admin_news_article_path

        fill_in 'Title', with: 'My Title'

        click_on 'Submit'
        
        expect(page).to have_content("Body can't be blank")
      end
    end   
  end

  context "editing an news article" do 

    describe "with valid data" do
      let!(:news_article) { create(:news_article) }

      it "should update the record" do
        visit edit_admin_news_article_path(news_article)

        fill_in 'Title', with: 'My Title'
        fill_in 'Body', with: 'some text'

        click_on 'Submit'

        expect(page).to have_content("My Title")
      end
    end

    describe "with invalid data" do
      let!(:news_article) { create(:news_article) }

      it "should raise an error" do
        visit edit_admin_news_article_path(news_article)

        fill_in 'Title', with: ''
        fill_in 'Body', with: 'some text'

        click_on 'Submit'

        expect(page).to have_content("Title can't be blank")
      end
    end  
  end

  describe "deleting a news article" do
    let!(:news_article) { create(:news_article) }
    
    it "should remove the record" do
      visit admin_news_articles_path

      click_on 'delete'

      expect(page).to_not have_content(news_article.title)
    end
  end 
end