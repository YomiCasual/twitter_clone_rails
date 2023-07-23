class AddLikesCounterCacheToTweets < ActiveRecord::Migration[7.0]
  def up
    add_column :tweets, :likes_count, :integer

    Tweet.find_each do |tweet|
      tweet.update! likes_count: tweet.likes.size
    end
  end
  def dow
    remove_column :tweets, :likes_count 
  end
end
