require 'rails_helper'

RSpec.describe 'entry title valid', type: :system do
  it 'has text so submits' do
    visit new_entry_path
    fill_in 'Name', with: "test"
    click_button 'Create new post'
    expect(page).to have_content('test')
  end
end

RSpec.describe 'entry title empty', type: :system do
    it 'shows the all entries text' do
      visit new_entry_path
      fill_in 'Notes', with: "test"
      click_button 'Create new post'
      expect(page).to have_xpath('//*[@id="new_entry"]/input[1]')
    end
end