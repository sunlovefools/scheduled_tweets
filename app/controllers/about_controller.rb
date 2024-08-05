class AboutController < ApplicationController
    def index
    end

    def hello
      redirect_to about_path
    end
end
