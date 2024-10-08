class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
        Current.user = User.find_by(id: session[:user_id])
    end
  end

  def make_sure_user_is_logged_in!
    redirect_to log_in_path, alert: "You have log in first before accessing the Twitter Account" if Current.user.nil?
  end
end
