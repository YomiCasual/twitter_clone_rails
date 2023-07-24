class LikesController < ApplicationController
    before_action :authenticate_user!

    def create

        @current_tweet_id = params['tweet_id']
        
        existing_like = Like.find_by tweet_id:  params["tweet_id"], user: current_user
        
        @isDeleted = !!existing_like
        
        if existing_like
            delete_existing_likes(existing_like)
        else
            create_new_likes(@current_tweet_id)
        end

        @tweet = Tweet.find_by id: @current_tweet_id
        respond_to do |format|
                format.turbo_stream 
                format.html {  redirect_to dashboard_index_path }
        end
        
    end

    private 

    def delete_existing_likes(existing_like)
            existing_like.destroy
    end

    def create_new_likes(tweet_id)
        
       @likes = Like.new(tweet_id: tweet_id, user: current_user)
        if @likes.save
         return 
        else
            flash.now[:alert] = extract_errors(@likes)
            render "dashboard/index", status: :unprocessable_entity
            return 
        end
    end

end