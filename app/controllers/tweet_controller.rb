class TweetController < ApplicationController
    before_action :authenticate_user!
    def create
        tweet = Tweet.new(tweet_params.merge(user: current_user))
        if tweet.save
            flash[:notice] = "Sucessfully saved tweet"
            redirect_to root_path
        else
            flash.now[:alert] = extract_errors(tweet)
            render "home/index", status: :unprocessable_entity
        end
    end


    private 
    def tweet_params 
        params.require(:tweet).permit(:body)
    end
end