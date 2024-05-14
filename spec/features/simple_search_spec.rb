require 'rails_helper'

RSpec.feature "SimpleSearches", type: :feature do
  it "searches for a breed", :vcr do
    visit root_path

    within('#breed-form-container') do
      fill_in 'forms_breed_form[name]', with: 'hound'
      click_button 'Submit'
    end

    expect(page).to have_selector 'img', visible: true
  end
end
