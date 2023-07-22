class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, presence: true


  scope :newest_first, -> { order(created_at: :desc) }
end
