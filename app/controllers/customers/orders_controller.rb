module Customers
	class OrdersController < ApplicationController
		def index
			render json: current_user.orders, status: :ok
		end

		def create
			order = current_user.orders.new(order_params)

			if order.save
				render json: { message: 'Order created successfully' }, status: :ok
			else
				render json: { errors: order.errors.full_messages },
							status: :unprocessable_entity
			end
		end

		private

		def order_params
			params.permit(order_item_attributes: [:item_id, :quantity], combo_item_attributes: [:item_id, :quantity])
		end
	end
end