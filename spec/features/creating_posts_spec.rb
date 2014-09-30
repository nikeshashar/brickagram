require 'spec_helper'
 
  context 'logged in' do
    before do
      chloe = create(:user)
      login_as chloe
    end

    let(:chloe) { create(:user)}

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
