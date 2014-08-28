require 'rails_helper'

describe 'orders page' do

  context 'logged in as admin' do
  before do 
    post = create(:post)
  end
    
    context 'no orders' do
        it 'displays the product' do
          admin = create(:admin)
          login_as admin
          post = create(:post)
          order = admin.orders.create(user_id: admin.id, post_id: post.id)        
          visit '/orders'
          expect(page).to have_link 'Lego'
        end 

        it 'displays which user has ordered the product' do 
          visit orders_path
          save_and_open_page
          expect(page).to have_content('wiggle@lego.com')
        end 

        it 'displays an order number' do 
          expect(page).to have_content '123456789'
        end 
    end
  end

  context 'not logged in as admin' do
    it 'prompts to sign in' do
      user = create(:user)
      login_as user
      visit '/orders'
      expect(page).to have_content 'Sign Up'
    end
  end
end
