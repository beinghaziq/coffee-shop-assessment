class CombosController < ApplicationController
	def create
		combo = Combo.new(combo_params)
		if combo.save
			render json: { message: 'Combo created successfully' }, status: :ok
		else
			render json: { errors: combo.errors.full_messages },
							status: :unprocessable_entity
		end
	end

	private

	def combo_params
    	params.permit(:name, discount_attributes: [:amount, :discount_type], combo_items_attributes: [:item_id, :quantity])
  	end
end
