# frozen_string_literal: true

class TweetCard::NewComponent < ViewComponent::Base
  def initialize(tweet:)
    @tweet = tweet
  end


  attr_reader :tweet

  def tweet_owner 
    tweet.user.user_handle
  end
  
  def tweet_date 
   tweet.created_at.strftime("%d/%m/%Y")
  end

  def time_ago
   time_ago_in_words(tweet.created_at)
  end

end
