# frozen_string_literal: true

class NavBarItem::NewComponent < ViewComponent::Base
  def initialize(text:, image:, link: nil)
    @text = text
    @image = image
    @link = link
  end

  attr_reader :text, :image, :link

end
