class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_save :set_display_name, if: -> {  username.present? && display_name.blank?}


  validates :username, uniqueness: { case_sensitive: false }, allow_blank: true


  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_tweets, :through => :likes, :source => :tweet
  has_many :bookmarks, dependent: :destroy
  has_many :bookmarked_tweet, through: :bookmarks, source: :tweet 


  has_one_attached :avatar

  def user_handle
    "@#{username || email}"
  end
  def user_display
    display_name || username&.humanize || email
  end

  def set_display_name
    self.display_name = username&.humanize
  end
  


end
