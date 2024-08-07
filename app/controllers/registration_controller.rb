class RegistrationController < ApplicationController
  def new
    @user = User.new #Assgning @user to User.new, rails know that all I will be using 'User' db for the data base in new.html.erb
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id #session = {user_id:@user.id}
      redirect_to root_path, notice:"Successfully created account"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation) #To filter out the attributes going into the database
  end
end