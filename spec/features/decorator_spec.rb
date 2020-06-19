require "rails_helper"

RSpec.describe "Decorators", type: :feature do
  include BasicAuthHelper

  before(:each) do
    log_in
  end

  context "creating a decorator" do
    
    describe "viewing all decorators" do
      it "should display a list of decorators" do
        visit admin_decorators_path

        create_list(:decorator, 5)

        expect(page).to have_content(@decorators)
      end
    end

    describe "with valid data" do
      it "should create a decorator" do
        visit new_admin_decorator_path

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
        visit new_admin_decorator_path

        fill_in 'Title', with: 'Joe Bloggs'
        fill_in 'Subtitle', with: 'Developer'
        fill_in 'Body', with: 'Some text'

        click_on 'Submit'

        expect(page).to have_content("Email can't be blank")
      end
    end

  end

  context "editing a decorator" do

    describe "with valid data" do
      let!(:decorator) { create(:decorator) }

      it "should update the record" do
        visit edit_admin_decorator_path(decorator)

        fill_in 'Title', with: 'Jane Bloggs'
        fill_in 'Subtitle', with: 'Developer'

        click_on 'Submit'

        expect(page).to have_content("Jane Bloggs")
      end
    end

    describe "with invalid data" do
      let!(:decorator) { create(:decorator) }

      it "should raise an error" do
        visit edit_admin_decorator_path(decorator)

        fill_in 'Title', with: ''
        fill_in 'Subtitle', with: 'Developer'

        click_on 'Submit'

        expect(page).to have_content("Title can't be blank")
      end
    end

  end

  describe "deleting a decorator" do
    let!(:decorator) { create(:decorator) }

    it "should remove the record" do
      visit admin_decorators_path

      click_on 'delete'

      expect(page).to_not have_content(decorator.title)
    end
  end

end