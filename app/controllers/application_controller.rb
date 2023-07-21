class ApplicationController < ActionController::Base


    def extract_errors(model)
        model.errors.first.full_message
    end
end
