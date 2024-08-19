class TweetsController < ApplicationController
  before_action :make_sure_user_is_logged_in!
  before_action :set_tweet, only: [:edit,:update,:destroy]
  #Because the three of these actions requires an id attached to it
  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweets_params)
    if @tweet.save
      TweetJob.set(wait_until: @tweet.publish_at).perform_later(@tweet)
      redirect_to tweets_path, notice: "Successfully scheduled a tweet"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweets_params)     
      TweetJob.set(wait_until: @tweet.publish_at).perform_later(@tweet)
      redirect_to tweets_path, notice: "Successfully edited the scheduled tweet"
    else
      render :edit
    end
  end

  def destroy
    if @tweet.destroy
      redirect_to tweets_path, notice: "Successfully deleted the scheduled tweet"
    end
  
  end

  private
  def tweets_params
    params.require(:tweet).permit(:twitter_account_id, :body,:publish_at)
  end

  def set_tweet
    @tweet = Tweet.find_by(id: params[:id])
  end
end
