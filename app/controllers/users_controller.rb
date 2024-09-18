class UsersController < ApplicationController
	def create
		user = User.new(user_params.merge(roles: ['customer']))
    if user.save
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: user.name }, status: :ok
    else
      render json: { errors: user.errors.full_messages },
             status: :unprocessable_entity
    end
	end

	private

	def user_params
    params.permit(
       :name, :email, :password, :password_confirmation
    )
  end
end
