class ItemsController < ApplicationController
	def index
		render json: Item.all, status: :ok
	end

	def create
		item = Item.new(item_params)
		if item.save
			render json: { message: 'Item created successfully' }, status: :ok
		else
			render json: { errors: item.errors.full_messages },
				status: :unprocessable_entity
		end
	end

	# TODO: Use rails optimistic locking to handle versioning
	def item_params
    	params.permit(:name, :description, :amount, :quantity, :tax_percentage, :category_id, :version)
  	end
end