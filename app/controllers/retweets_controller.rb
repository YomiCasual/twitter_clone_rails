class RetweetsController < ApplicationController
   before_action :authenticate_user!

    def create
        @current_tweet_id = params['tweet_id']
        existing_retweet = Retweet.find_by tweet_id:  params["tweet_id"], user: current_user
        
        @has_existing_retweet = !!existing_retweet
        
        if existing_retweet
            delete_existing_retweet(existing_retweet)
        else
            create_new_retweet(@current_tweet_id)
        end

        @tweet = Tweet.find_by id: @current_tweet_id
        respond_to do |format|
                format.turbo_stream 
                format.html {  redirect_to dashboard_index_path }
        end
        
    end

    private 

    def delete_existing_retweet(existing_retweet)
            existing_retweet.destroy
    end

    def create_new_retweet(tweet_id)
       retweet = Retweet.new(tweet_id: tweet_id, user: current_user)
        if retweet.save
         return 
        else
            flash.now[:alert] = extract_errors(retweet)
            render "dashboard/index", status: :unprocessable_entity
            return 
        end
    end

end