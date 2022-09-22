class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  helper_method :current_user, :logged_in?

  def require_user
    if !user_signed_in?
      flash[:alert] = "You must be logged in to perform this action"
      redirect_to new_user_session_path
    end
  end
end
