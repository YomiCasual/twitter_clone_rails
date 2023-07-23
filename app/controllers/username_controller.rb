class UsernameController < ApplicationController
    skip_before_action :redirect_to_update_username
    before_action :authenticate_user!
    
    def new 

    end


    def update
      if  current_user.update!(permited_username)
        flash[:notice] = "Successfully updated username"
        redirect_to dashboard_index_path
      else
        flash.now[:alert] = extract_errors(current_user)
        render :new, status: :unprocessable_entity
      end
    end


    def permited_username
        params.require(:user).permit(:username, :display_name, :avatar)
    end
end