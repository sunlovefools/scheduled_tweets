class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length:{ minimum: 1, maximum: 280}
  validates :publish_at, presence:true

  after_initialize do
    #Not all classes will undergo initialisation, in this case "new" action initialise 
    self.publish_at ||= 24.hours.from_now
    #setting the default value for publish_at if the value is not set by user
    #"||=" is an operator that says if the value is nil, it will do the following action
  
  
  def publish?
    tweet_id?
    #"?" will return a True or False
    #If tweet_id is nil then False, but if not nil then is True
  end

  def publish_to_twitter!
    tweet_body = body
    tweet_payload = {text: tweet_body}.to_json
    tweet = twitter_account.client.post("tweets", tweet_payload)
    update(tweet_id: tweet["data"]["id"])
    
  end
  end
end
