class RegistrationController < ApplicationController
  def create
    validator = RegistrationValidator.new(registration_params)
    return render json: { errors: validator.errors }, status: :unprocessable_entity unless validator.valid?

    user = User.find_by_email registration_params[:email]
    if user.nil?
      user = User.create(
        email: registration_params[:email],
        password: registration_params[:password]
      )
    end

    render json: UserSerializer.new(user).as_json
  end

  private

  def registration_params
    params.require(:registration).permit(:email, :password)
  end
end
