class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, presence: true


  scope :newest_first, -> { order(created_at: :desc) }

  delegate :user_handle, :user_display, :avatar, to: :user
end
