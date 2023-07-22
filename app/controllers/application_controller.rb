class ApplicationController < ActionController::Base

    before_action :redirect_to_update_username
    helper_method :nav_links

    def extract_errors(model)
        model.errors.first.full_message
    end

    def after_sign_in_path_for(resource)
        dashboard_index_path || root_path
    end

    protected 
    def nav_links
      @links =  YAML.load_file('db/yamls/navigation.yml')
      @links
    end
    
    def redirect_to_update_username
        if user_signed_in? && current_user.username.blank?
            redirect_to new_username_path and return
        end
    end

end
