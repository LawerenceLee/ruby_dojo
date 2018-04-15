require 'rails_helper'

feature "guest attempts to log in" do
    scenario "enters a username not in db, so user is created & signed in" do
        visit new_user_path
        fill_in "username", with: "Mr.GoodMan"
        click_button "Log in"
        expect(page).to have_content "Welcome, Mr.GoodMan"
        expect(current_path).to eq("/messages/index")
    end
    scenario "enters a username in db, user is signed in" do
        create(:user)
        visit new_user_path
        fill_in "username", with: "JohnnyDoe"
        click_button "Log in"
        expect(page).to have_content "Welcome, JohnnyDoe"
        expect(current_path).to eq("/messages/index")
    end
    scenario "does not enter a username" do
        visit new_user_path
        click_button "Log in"
        expect(page).to have_content "Username can't be blank"
        expect(page).to have_content "Username is too short (minimum is 5 characters)"
        expect(current_path).to eq("/users/new")
    end
end