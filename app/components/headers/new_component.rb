# frozen_string_literal: true

class Headers::NewComponent < ViewComponent::Base

    def initialize(page_title: )
        @page_title = page_title
    end

    attr_reader :page_title
end
