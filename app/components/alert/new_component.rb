# frozen_string_literal: true

class Alert::NewComponent < ViewComponent::Base
  def initialize(type: "primary", text:, class_names: "", is_visible: true)
    @type = type
    @text = text
    @class_names = class_names
    @is_visible = is_visible
  end

  def render?
    is_visible
  end


  attr_reader :type, :text, :class_names, :is_visible

end
