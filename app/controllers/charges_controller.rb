class ChargesController < ApplicationController
	
	def new
	  @post = Post.find params[:post_id]
	end

	def create
	  @post = Post.find params[:post_id]
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	  Order.create(user: current_user, post: @post)
	  flash[:notice] = 'Hey #{current_user.email} - thank you for your order'
	  redirect_to '/posts'

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
