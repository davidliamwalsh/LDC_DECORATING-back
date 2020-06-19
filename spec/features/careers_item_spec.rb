require "rails_helper"

RSpec.describe "Careers Items", type: :feature do
  include BasicAuthHelper

  before(:each) do
    log_in
  end

  context "creating a careers item" do

    describe "viewing all careers items" do
      it "should show a list of careers items" do
        visit admin_careers_items_path

        create_list(:careers_item, 5)
      
        expect(page).to have_content(@careers_items)
      end
    end

    describe "with valid data" do
      it "should create a careers item" do
        visit new_admin_careers_item_path

        fill_in 'Title', with: 'Developer'
        fill_in 'Job description', with: 'some text'

        click_on 'Submit'
        
        expect(page).to have_content("Developer")
      end
    end

    describe "with invalid data" do
      it "should raise an error" do
        visit new_admin_careers_item_path

        fill_in 'Title', with: 'Developer'

        click_on 'Submit'
        
        expect(page).to have_content("Job description can't be blank")
      end
    end   
  end

  context "editing an careers item" do 

    describe "with valid data" do
      let!(:careers_item) { create(:careers_item) }

      it "should update the record" do
        visit edit_admin_careers_item_path(careers_item)

        fill_in 'Title', with: 'Engineer'
        fill_in 'Job description', with: 'some text'

        click_on 'Submit'

        expect(page).to have_content("Engineer")
      end
    end

    describe "with invalid data" do
      let!(:careers_item) { create(:careers_item) }

      it "should raise an error" do
        visit edit_admin_careers_item_path(careers_item)

        fill_in 'Title', with: ''
        fill_in 'Job description', with: 'some text'

        click_on 'Submit'

        expect(page).to have_content("Title can't be blank")
      end
    end  
  end

  describe "deleting a careers item" do
    let!(:careers_item) { create(:careers_item) }
    
    it "should remove the record" do
      visit admin_careers_items_path

      click_on 'delete'

      expect(page).to_not have_content(careers_item.title)
    end
  end 
end