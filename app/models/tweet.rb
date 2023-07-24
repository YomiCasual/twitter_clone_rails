class Tweet < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_user, through: :bookmarks, source: :user 
  has_many :retweets, dependent: :destroy
  has_many :retweet_users, through: :retweets, source: :user

  validates :body, presence: true


  scope :newest_first, -> { order(created_at: :desc) }

  delegate :user_handle, :user_display, :avatar, to: :user

  def has_liked(user)
    likes.find_by user: user
  end

  def has_bookmarked(user)
    bookmarks.find_by user: user
  end

  def has_retweeted(user)
    retweets.find_by user: user
  end
end
