require 'rails_helper'

# end to end test of user logging in, navigating to notes, 
# creating a new note

RSpec.describe 'end2end create entry', type: :system do

    it 'logs in and shows home page' do
        visit root_path
        expect(page).to have_content('Log In')
        fill_in 'username', with: "test"
        fill_in 'password', with: "testpassword"
        click_link 'Log in'
        expect(page).to have_content('All Entries')
    end

    it 'shows the all notes page' do
        visit welcome_index_path
        expect(page).to have_content('All Entries')
        find(:xpath, '/html/body/div/div[3]/div/ul/li[2]/strong/a').click
        expect(page).to have_content('All Notes')
    end

    it 'shows new entry page and creates entry' do
        visit entries_path
        sleep 2
        click_link 'New note'
        expect(page).to have_content('Create a new note')
        fill_in 'Name', with: "test"
        fill_in 'Link', with: "www.test.com"
        fill_in 'Notes', with: "test notes"
        sleep 2
        click_button 'Create new post'
        expect(page).to have_content('test')
    end
end