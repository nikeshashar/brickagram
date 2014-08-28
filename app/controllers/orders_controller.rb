class OrdersController < ApplicationController

	before_action :admin?

	def index
		@orders = Order.all
	end

	def admin?
	  (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
	end
	
end
