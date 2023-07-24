class BookmarksController < ApplicationController
    before_action :authenticate_user!

    def create
        @current_tweet_id = params['tweet_id']
        existing_bookmark = Bookmark.find_by tweet_id:  params["tweet_id"], user: current_user
        
        @has_existing_bookmark = !!existing_bookmark
        
        if existing_bookmark
            delete_existing_bookmark(existing_bookmark)
        else
            create_new_bookmark(@current_tweet_id)
        end

        @tweet = Tweet.find_by id: @current_tweet_id
        respond_to do |format|
                format.turbo_stream 
                format.html {  redirect_to dashboard_index_path }
        end
        
    end

    private 

    def delete_existing_bookmark(existing_bookmark)
            existing_bookmark.destroy
    end

    def create_new_bookmark(tweet_id)
       bookmark = Bookmark.new(tweet_id: tweet_id, user: current_user)
        if bookmark.save
         return 
        else
            flash.now[:alert] = extract_errors(bookmark)
            render "dashboard/index", status: :unprocessable_entity
            return 
        end
    end

end