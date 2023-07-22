# frozen_string_literal: true

class Button::NewComponent < ViewComponent::Base
  def initialize(text:, class_names: "", url: nil, type: "button", variant: "twitter")
    @text = text
    @class_names = class_names
    @url = url
    @type = type
    @variant = variant
  end

  def render?
    true
  end

  attr_reader :type, :text, :class_names, :url, :variant


end
