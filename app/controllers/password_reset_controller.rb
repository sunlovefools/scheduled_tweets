class PasswordResetController < ApplicationController
  def new 
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_later
    end
    redirect_to root_path, notice:"If the email was found in the system, a link to change password will be send via email"

    def edit
      @user = User.find_signed!(params[:token], purpose: "password_reset") #Auto pop up Invalid Signature Error if the token is expired
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to password_reset_path, alert: "Your token has expired. Please try again"
    end

    def update
      @user = User.find_signed!(params[:token], purpose: "password_reset")
      if @user.update(password_params)
        redirect_to log_in_path, notice: "Password Reset Successfully. Please Sign In"
      else
        render :edit
      end
    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to password_reset_path, alert:"Your token has expired"
    end
    
  end
  private
  def password_params
    params.require(:user).permit(:password,:password_confirmation)
  end
end