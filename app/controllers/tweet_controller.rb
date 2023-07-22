class TweetController < ApplicationController
    before_action :authenticate_user!
    def create
        @tweet = Tweet.new(tweet_params.merge(user: current_user))
        if @tweet.save

            respond_to do |format|
                flash.now[:notice] = "Sucessfully saved tweet"
                format.turbo_stream 
                format.html {  
                    redirect_to dashboard_index_path
                }
            end

        else
            flash.now[:alert] = extract_errors(tweet)
            render "dashboard/index", status: :unprocessable_entity
        end
    end


    private 
    def tweet_params 
        params.require(:tweet).permit(:body)
    end
end