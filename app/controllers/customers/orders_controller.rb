module Customers
	class OrdersController < ApplicationController
		def index
			render json: current_user.orders, status: :ok
		end

		def create
			order = current_user.orders.new
			if order.save
				render json: { message: 'Order created successfully' }, status: :ok
			else
				render json: { errors: order.errors.full_messages },
							status: :unprocessable_entity
			end
		end
	end
end