# frozen_string_literal: true

class TweetAction::NewComponent < ViewComponent::Base

    def initialize(image:, text:, size: "20x20", link: "")
        @image = image
        @text = text
        @size = size
        @link = link
    end

    attr_reader :image, :text, :size, :link

    def get_link


    end
end
