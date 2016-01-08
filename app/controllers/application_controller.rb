class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def authorize
  	redirect_to login_form_path unless logged_in?
  end

  def authenticate
      unless logged_in?
        flash[:error] = "Woops! You must be logged in to see this"
        redirect_to login_form_url
      end
  end

end
