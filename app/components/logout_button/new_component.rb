# frozen_string_literal: true

class LogoutButton::NewComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def render?
    user.present?
  end

  attr_reader :user
end
