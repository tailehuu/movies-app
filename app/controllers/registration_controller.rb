class RegistrationController < ApplicationController
  def create
    # TODO
    # - should validate email & password here
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
