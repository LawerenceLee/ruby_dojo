require 'rails_helper'

feature 'user attempts to post a message' do
    before(:each) do
        visit new_user_path
        fill_in "username", with: "JohnnyRain"
        click_button "Log in"
    end
    scenario "message is too short" do
        visit index_path
        fill_in "message_box", with: "at"
        click_button "Post a Message"
        expect(page).to have_content "Content is too short (minimum is 11 characters"
        expect(current_path).to eq("/messages/index")
    end
    scenario "message is empty" do
        visit index_path
        click_button "Post a Message"
        expect(page).to have_content "Content can't be blank"
        expect(current_path).to eq("/messages/index")
    end
    scenario "message is the right length" do
        fill_in "message_box", with: "This a message, YAYA"
        click_button "Post a Message"
        expect(page).to have_content "This a message, YAYA"
        expect(current_path).to eq("/messages/index")
    end
end