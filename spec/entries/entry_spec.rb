require 'rails_helper'

RSpec.describe 'Entries content', type: :system do
  it 'shows the all entries text' do
    visit entries_path
    expect(page).to have_content('All Notes')
  end
end

RSpec.describe 'edit entries', type: :system do
  it 'shows edit entry page' do
    visit entries_path
    sleep 2
    find(:xpath, "/html/body/div/div[4]/nav[1]/div[2]/p[1]/a").click
    expect(page).to have_content('Edit your note')
  end
end

RSpec.describe 'new entries', type: :system do
  it 'shows new entry page' do
    visit entries_path
    sleep 2
    click_link 'New note'
    expect(page).to have_content('Create a new note')
  end
end

RSpec.describe 'create entry', type: :system do
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

# RSpec.describe 'delete entry', type: :system do
#   it 'deletes an entry' do
#     visit entries_path
#     sleep 2
#     find(:xpath, "/html/body/div/div[4]/nav[1]/div[2]/form/button").click
#     expect(page).not_to have_content('Edit your note')
#   end
# end