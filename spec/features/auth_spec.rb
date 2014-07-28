require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user2@example.com", name: "user 2"

    visit root_path
    click_on "Login"
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user2@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("user2@example.com")
  end

end
