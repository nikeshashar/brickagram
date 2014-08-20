require 'spec_helper'

describe 'tagging posts' do
  before do
    chloe = User.create(email: 'wiggle@lego.com', password: '12345678', password_confirmation: '12345678')
    login_as chloe
  end

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

describe 'filtering by tags' do
    before do
        Post.create(title: 'PostA', tags_list: '#batman')
        Post.create(title: 'PostB', tags_list: '#emmet')
    end

    it 'filters to show only tagged posts' do
        visit '/posts'
        click_link '#batman'
        expect(page).to have_css 'h1', text: 'Posts tagged with'
        expect(page).to have_content 'PostA'
        expect(page).not_to have_content 'PostB'
    end

    it 'is accessible via pretty urls' do
        visit '/tags/batman'
        expect(page).to have_content 'PostA'
    end

end
