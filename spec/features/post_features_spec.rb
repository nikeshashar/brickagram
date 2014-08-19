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

    it 'displays all posts' do
      visit '/posts'
      expect(page).to have_content 'Hello World'
    end
   end

   describe 'creating posts ' do
      it 'adds the post to a form' do
        visit '/posts'
        click_link 'New Post'
        fill_in 'Title', with: 'Lego rules'
        click_button 'Create Post'

        expect(page).to have_content 'Lego rules'
        expect(current_path).to eq '/posts'
      end

    it 'can attach an image to a post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Lego rules'
      attach_file 'Picture', Rails.root.join('spec/images/lego.jpg')
      click_button 'Create Post'
      expect(page).to have_css 'img.uploaded-pic'
    end

      it 'displays no image if no picture attached' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Lego rules'
      click_button 'Create Post'
      expect(page).not_to have_css 'img.uploaded-pic'
    end

   end
end

