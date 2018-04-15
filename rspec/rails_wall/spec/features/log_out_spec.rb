require 'rails_helper'

feature 'log out' do
    scenario 'successfully so' do
        visit new_user_path
        fill_in "username", with: "JohnnyRain"
        click_button "Log in"
        click_link "Log out"
        expect(current_path).to eq("/users/new")
    end
end
