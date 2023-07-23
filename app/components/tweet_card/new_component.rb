# frozen_string_literal: true

class TweetCard::NewComponent < ViewComponent::Base
  # include ApplicationController
  delegate :get_link, :get_label, to: :helpers
  
  def initialize(tweet:)
    @tweet = tweet
  end

  attr_reader :tweet

    def tweet_date 
        tweet.created_at.strftime("%d/%m/%Y")
    end

    def time_ago
        time_ago_in_words(tweet.created_at)
    end

    def tweet_actions
     helpers.tweet_actions
    end





end
