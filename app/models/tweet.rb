class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  validates :body, presence: true


  scope :newest_first, -> { order(created_at: :desc) }

  delegate :user_handle, :user_display, :avatar, to: :user

  def has_liked(user)
    likes.find_by user: user
  end
end
