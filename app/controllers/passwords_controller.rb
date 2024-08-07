class PasswordsController < ApplicationController
  before_action :make_sure_user_is_logged_in!
  def edit
  end

  def update
    if Current.user.update(password_params) #**
      redirect_to root_path, notice:"Password Updated!"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation) #require(:user) means that it make sure that there is "user" key in the params
    #Why will the params send over have a key of "user"?
    #Because of the instance key of Current.user which is linked to the User model
  end
end