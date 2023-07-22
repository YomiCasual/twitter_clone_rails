class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :username, uniqueness: { case_sensitive: false }, allow_blank: true


  has_many :tweets

  def user_handle
    "@#{username || email}"
  end
  def user_display
    display_name || username.humanize
  end

end
