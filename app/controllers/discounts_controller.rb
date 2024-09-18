class DiscountsController < ApplicationController
	def create
		discount = Discount.new(discount_params)
    if discount.save
      render json: { message: 'Discount created successfully' }, status: :ok
    else
      render json: { errors: discount.errors.full_messages },
             status: :unprocessable_entity
    end
	end

	private

	def discount_params
    params.permit(:discountable_type, :discountable_id, :amount, :type)
  end
end
