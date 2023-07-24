require 'rails_helper'


RSpec.describe "Bookmarks", type: :request do
    describe "CREATE /bookmark" do
        let (:user) { create(:user, username: "usernamke")}
        let (:tweet) { create(:tweet, user: user)}

        context "When user tries to bookmark a new post" do
            it "it should bookmark successfully" do
                sign_in user
                expect {
                    post tweet_bookmarks_path(tweet)
                }.to change { Bookmark.count }.from(0).to(1)
                expect(tweet.reload.bookmarked_user.size).to eq(1)
            end
        end

        context "Should rmeove a bookmark  from a bookmarked post" do
            it "it should unbookmarked successfully" do
                sign_in user
                expect {
                    post tweet_bookmarks_path(tweet)
                }.to change { Bookmark.count }.from(0).to(1)
                expect {
                    post tweet_bookmarks_path(tweet)
                }.to change { Bookmark.count }.from(1).to(0)
                expect(tweet.reload.bookmarked_user.size).to eq(0)
            end
        end
     
    end
end