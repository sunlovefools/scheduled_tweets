class MainController < ApplicationController
    def main
        #flash.now[:notice] = "Successfully logged in"
        #flash.now[:alert] = "Unsuccessful login"
        if session[:user_id]
          @user = User.find_by(id: session[:user_id])
        end
    end
end