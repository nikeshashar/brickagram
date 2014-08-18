require 'rails_helper'

describe 'posts' do
  context 'before anyone posts' do
    it 'displays no posts' do
      visit '/posts'
      expect(page).to have_content 'There are no posts'
    end
  end

   context 'with posts' do
    before do
      Post.create(title: 'Hello World')
    end

    it 'displays the posts title' do
      visit '/posts'
      expect(page).to have_content 'Hello World'
    end
   end
end

