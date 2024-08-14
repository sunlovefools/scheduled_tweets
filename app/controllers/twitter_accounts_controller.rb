class TwitterAccountsController < ApplicationController
  before_action :make_sure_user_is_logged_in!
  def index
    @twitter_accounts = Current.user.twitter_accounts
    # This is because the view part will be showing the user's all twitter accounts
  end

  def destroy
    @twitter_accounts = Current.user.twitter_accounts.find(params[:id])
    @twitter_accounts.destroy
    redirect_to twitter_accounts_path, notice: "Successfully disconnect @#{@twitter_accounts.username}"
  end
end