class SessionController < ApplicationController
  def sign_in
    email = user_params[:email]
    password = user_params[:password]
    user = User.find_by_email email
    return render json: { message: 'user_not_found' }, status: :not_found if user.nil?

    if user.valid_password? password
      render json: user
    else
      render json: { message: 'invalid_username_or_password' }, status: :unprocessable_entity
    end
  end

  def sign_out
    render json: { message: 'success' }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
