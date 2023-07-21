class UsernameController < ApplicationController
    skip_before_action :redirect_to_update_username
    before_action :authenticate_user!
    
    def new 

    end


    def update
      current_user.username = permited_username[:username]
      if current_user.save
        flash[:notice] = "Successfully updated username"
        redirect_to dashboard_index_path
      else
        flash.now[:alert] = extract_errors(current_user)
        render :new, status: :unprocessable_entity
      end
    end


    def permited_username
        params.require(:username).permit(:username)
    end
end