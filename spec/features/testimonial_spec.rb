require "rails_helper"

RSpec.describe "testimonials", type: :feature do
  include BasicAuthHelper

  before(:each) do
    log_in
  end

  context "creating a testimonial" do

    describe "viewing all testimonials" do
      it "should show a list of testimonials" do
        visit admin_testimonials_path

        create_list(:testimonial, 5)
      
        expect(page).to have_content(@testimonials)
      end
    end

    describe "with valid data" do
      it "should create a testimonial" do
        visit new_admin_testimonial_path

        fill_in 'Title', with: 'My Title'
        fill_in 'Body', with: 'some text'

        click_on 'Submit'
        
        expect(page).to have_content("My Title")
      end
    end

    describe "with invalid data" do
      it "should raise an error" do
        visit new_admin_testimonial_path

        fill_in 'Title', with: 'My Title'

        click_on 'Submit'
        
        expect(page).to have_content("Body can't be blank")
      end
    end   
  end

  context "editing an testimonial" do 

    describe "with valid data" do
      let!(:testimonial) { create(:testimonial) }

      it "should update the record" do
        visit edit_admin_testimonial_path(testimonial)

        fill_in 'Title', with: 'My Title'
        fill_in 'Body', with: 'some text'

        click_on 'Submit'

        expect(page).to have_content("My Title")
      end
    end

    describe "with invalid data" do
      let!(:testimonial) { create(:testimonial) }

      it "should raise an error" do
        visit edit_admin_testimonial_path(testimonial)

        fill_in 'Title', with: ''
        fill_in 'Body', with: 'some text'

        click_on 'Submit'

        expect(page).to have_content("Title can't be blank")
      end
    end  
  end

  describe "deleting a testimonial" do
    let!(:testimonial) { create(:testimonial) }
    
    it "should remove the record" do
      visit admin_testimonials_path

      click_on 'delete'

      expect(page).to_not have_content(testimonial.title)
    end
  end 
end