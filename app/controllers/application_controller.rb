class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success

# dmb
  # def authenticate_user!
  #   if current_user.nil?
  #     # redirect_to '/admin/login', alert: "You should login first to visit that page."
  #     redirect_to '/login', alert: "You should login first to visit that page."
  #   end
  # end
  # dmb


  private
  def logged_in?
    current_user
 # dmb  current_user != nil
  end
  helper_method :logged_in?

  # dmb commented out to try below routine
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
 
  helper_method :current_user
  # byebug
  def require_user
    if current_user
      true
    else
      redirect_to new_user_session_path, notice: "You must be logged in to access that page."
    end
  end
end
