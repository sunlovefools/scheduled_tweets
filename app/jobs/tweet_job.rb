class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.publish?

    #Tweet Reschedule to the future
    #Check the publish_at attributre stored in the database
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
    
    #For background job, try not to cancel it
    #Instead, try to let all of them run, and until the point of running, use some logic to check whether they still need to run or not
  end
end
