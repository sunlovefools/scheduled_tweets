class AboutController < ApplicationController
  # before_action :make_sure_user_is_logged_in, except: :pricing
  # before_action :make_sure_user_is_logged_in, only: [:index, :hello]
  # So that an some action can still be processed eventhough user isnt logged in
  def index
    end

    def hello
      redirect_to about_path
    end
end
