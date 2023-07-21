class ApplicationController < ActionController::Base


    def extract_errors(model)
        model.errors.first.full_message
    end

    def after_sign_in_path_for(resource)
        dashboard_index_path || root_path
    end
end
