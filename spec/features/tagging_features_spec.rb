require 'spec_helper'

describe 'tagging posts' do
  it 'it displays the tags underneath a post' do
    visit '/posts'
    click_link 'New Post'
    fill_in 'Title', with: 'I love Tuesdays and lego'
    fill_in 'Tags', with: '#master_builders, #nikesh, #chloe'
    click_button 'Create Post'

    expect(page).to have_link '#master_builders'
    expect(page).to have_link '#nikesh'
    expect(page).to have_link '#chloe'
  end
end
