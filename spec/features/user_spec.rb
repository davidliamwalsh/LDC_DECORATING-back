require "rails_helper"

RSpec.describe "users", type: :feature do
  include BasicAuthHelper

  before(:each) do
    log_in
  end

  context "creating a user" do
    
    describe "viewing all users" do
      it "should display a list of users" do
        visit admin_users_path

        create_list(:user, 5)

        expect(page).to have_content(@users)
      end
    end

    describe "with valid data" do
      it "should create a user" do
        visit new_admin_user_path

        fill_in 'Title', with: 'Joe Bloggs'
        fill_in 'Subtitle', with: 'Developer'
        fill_in 'Body', with: 'Some text'
        fill_in 'Email', with: 'joebloggs@bloggs.com'

        click_on 'Submit'

        expect(page).to have_content("Joe Bloggs")
      end
    end

    describe "contains invalid data" do
      it "should raise an error" do
        visit new_admin_user_path

        fill_in 'Title', with: 'Joe Bloggs'
        fill_in 'Subtitle', with: 'Developer'
        fill_in 'Body', with: 'Some text'

        click_on 'Submit'

        expect(page).to have_content("Email can't be blank")
      end
    end

  end

  context "editing a user" do

    describe "with valid data" do
      let!(:user) { create(:user) }

      it "should update the record" do
        visit edit_admin_user_path(user)

        fill_in 'Title', with: 'Jane Bloggs'
        fill_in 'Subtitle', with: 'Developer'

        click_on 'Submit'

        expect(page).to have_content("Jane Bloggs")
      end
    end

    describe "with invalid data" do
      let!(:user) { create(:user) }

      it "should raise an error" do
        visit edit_admin_user_path(user)

        fill_in 'Title', with: ''
        fill_in 'Subtitle', with: 'Developer'

        click_on 'Submit'

        expect(page).to have_content("Title can't be blank")
      end
    end

  end

  describe "deleting a user" do
    let!(:user) { create(:user) }

    it "should remove the record" do
      visit admin_users_path

      click_on 'delete'

      expect(page).to_not have_content(user.title)
    end
  end

end