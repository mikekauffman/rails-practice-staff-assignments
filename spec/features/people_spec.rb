require 'spec_helper'

feature 'Users can see a list of people' do

  before do
    create_user email: "user1@example.com", name: 'Jimbo Example'
    create_person first_name: "Jimbo"

    visit root_path

    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
  end

  scenario 'User can see all people' do
    expect(page).to have_content 'Mr Jimbo Example'
  end

  scenario 'User can see information about a person' do
    click_on 'Mr Jimbo Example'
    expect(page).to have_content 'Mr Jimbo Example'
    expect(page).to have_content 'Locations'
  end

  scenario 'User can edit a person' do
    click_on 'Mr Jimbo Example'
    click_on 'edit person'
    fill_in 'person_first_name', with: 'James'
    click_on 'update'
    expect(page).to have_content 'Mr James Example'
    expect(page).to_not have_content 'Mr Jimbo Example'
    expect(page).to have_content 'Locations'
    end

  scenario 'User can only edit a person with valid attributed' do
    click_on 'Mr Jimbo Example'
    click_on 'edit person'
    fill_in 'person_title', with: ''
    fill_in 'person_first_name', with: ''
    fill_in 'person_last_name', with: 'Example'
    click_on 'update'
    expect(page).to have_content "You must enter a title / last name, or a first name/ last name."
  end

  scenario 'User can add a location to a person' do
    click_on 'Mr Jimbo Example'
    click_on '+ Add Location'
    expect(page).to have_content 'Assign Mr Jimbo Example to a Location'
    select 'Northeast', from: 'employment_location_id'
    fill_in 'employment_role', with: 'Manager'
    click_on "Assign"
    expect(page).to have_content "Northeast"
  end

  scenario 'User can only be assigned an employment with a location and role' do
    click_on 'Mr Jimbo Example'
    click_on '+ Add Location'

    fill_in 'employment_role', with: ''
    click_on "Assign"
    expect(page).to have_content "This assignment could not be created."
    expect(page).to have_content "Location can't be blank"
    expect(page).to have_content "Role can't be blank"
  end

end