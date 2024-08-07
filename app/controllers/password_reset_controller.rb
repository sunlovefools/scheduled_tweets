class PasswordResetController < ApplicationController
  def new 
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #send email
      Rails.logger.debug "#{@user.inspect}"
      PasswordMailer.with(user: @user).reset.deliver_later
    end

    redirect_to root_path, notice:"If the email was found in the system, a link to change password will be send via email"
  end
end