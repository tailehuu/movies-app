class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  def current_user
    @current_user
  end

  private

  # TODO Basic Authorization. Simple. Not secure
  def authenticate_user!
    email, password = request.headers['Authorization'].gsub('Basic ', '').split(':')
    user = User.find_by_email email
    @current_user = user && user.valid_password?(password) ? user : nil
  end
end
