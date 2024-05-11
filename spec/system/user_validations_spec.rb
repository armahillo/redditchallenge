require "rails_helper"

RSpec.describe "User validations", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "New user >" do
    before do
      visit new_user_path
      expect(page).to have_text("New user")
    end

    let(:valid_user) { attributes_for(:user) }

    scenario "A successful user creation" do
      fill_in :user_first_name, with: valid_user[:first_name]
      fill_in :user_middle, with: valid_user[:middle]
      fill_in :user_last_name, with: valid_user[:last_name]
      fill_in :user_address, with: valid_user[:address]
      fill_in :user_email, with: valid_user[:email]
      fill_in :user_phone, with: valid_user[:phone]

      click_on "Create User"
      expect(page).to have_text "successfully"
    end

    scenario "First name is required" do
      fill_in :user_first_name, with: ''

      click_on "Create User"

      expect(page).to have_text "First name can't be blank"
    end

    scenario "Email is required" do
      fill_in :user_email, with: ''

      click_on "Create User"

      expect(page).to have_text "e-mail must be in a valid format"
    end

    scenario "Email must be a valid format" do
      fill_in :user_email, with: 'foo@foo@foo.com'

      click_on "Create User"

      expect(page).to have_text "e-mail must be in a valid format"
    end

    scenario "Email allows for longer domain name tokens" do
      fill_in :user_email, with: 'foo@foo.foo.com'

      click_on "Create User"

      expect(page).to have_no_text "e-mail must be in a valid format"
    end

    scenario "Phone is required" do
      fill_in :user_phone, with: ''

      click_on "Create User"

      expect(page).to have_text "Phone must be in the format"
    end

    scenario "Phone must be in the xxx.xxx.xxxx format" do
      fill_in :user_phone, with: '123-123-1234'

      click_on "Create User"

      expect(page).to have_text "Phone must be in the format"
    end
  end

end