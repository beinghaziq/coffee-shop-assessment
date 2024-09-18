class CombosController < ApplicationController
	def combo_params
		combo = Combo.new(discount_params)
		if combo.save
			render json: { message: 'Combo created successfully' }, status: :ok
		else
			render json: { errors: combo.errors.full_messages },
							status: :unprocessable_entity
			end
	end

	private

	def combo_params
    params.permit(:name discount_attributes: [:amount, :type])
  end
end
