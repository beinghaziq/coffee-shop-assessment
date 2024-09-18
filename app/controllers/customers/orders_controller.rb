module Customers
	class OrdersController < ApplicationController
		before_action :find_order, only: :update

		def index
			render json: current_user.orders, status: :ok
		end

		def create
			order = Order.new(order_params.merge(customer_id: current_user.id))

			if order.save
				render json: { message: 'Order created successfully' }, status: :ok
			else
				render json: { errors: order.errors.full_messages },
							status: :unprocessable_entity
			end
		end

		def update

			if @order.update(update_order_params)
				render json: { message: 'Order updated successfully' }, status: :ok
			else
				render json: { errors: order.errors.full_messages },
							status: :unprocessable_entity
			end
		end

		private

		def order_params
			params.permit(:status, order_items_attributes: [:item_id, :quantity], order_combos_attributes: [:combo_id, :quantity])
		end

		def update_order_params
			params.permit(:status)
		end

		def find_order
			@order = Order.find(params[:id])
		end
	end
end