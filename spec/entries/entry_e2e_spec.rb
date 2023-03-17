require 'rails_helper'

# end to end test of user logging in, navigating to notes, 
# creating a new note

RSpec.describe 'end2end create entry', type: :system do

    it 'logs in and shows home page' do
        visit root_path
        sleep 1
        expect(page).to have_content('Log In')
        fill_in 'username', with: "test"
        fill_in 'password', with: "testpassword"
        sleep 1
        find(:xpath, '/html/body/div/div[5]/form/div/div[2]/div/a[1]').click
        expect(page).to have_content('All Entries')
        sleep 1
    end

    it 'shows the all notes page' do
        visit welcome_index_path
        expect(page).to have_content('All Entries')
        find(:xpath, '/html/body/div/div[3]/div/ul/li[2]/strong/a').click
        sleep 1
        expect(page).to have_content('All Notes')
        sleep 1
    end

    it 'shows new entry page and creates entry' do
        visit entries_path
        click_link 'New note'
        expect(page).to have_content('Create a new note')
        fill_in 'Name', with: "test"
        fill_in 'Link', with: "www.test.com"
        fill_in 'Notes', with: "test notes"
        sleep 1
        click_button 'Create new post'
        expect(page).to have_content('test')
        sleep 1
    end
end