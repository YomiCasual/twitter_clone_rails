require 'rails_helper'


RSpec.describe "Likes", type: :request do
    describe "CREATE /likes" do
        let (:user) { create(:user, username: "usernamke")}
        let (:tweet) { create(:tweet, user: user)}

        context "When user tries to like a new post" do
            it "it should liked successfully" do
                sign_in user
                expect {
                    post tweet_likes_path(tweet)
                }.to change { Like.count }.from(0).to(1)
                expect(tweet.reload.likes_count).to eq(1)
            end
        end

        context "Should disliked a liked post" do
            it "it should unliked successfully" do
                sign_in user
                expect {
                    post tweet_likes_path(tweet)
                }.to change { Like.count }.from(0).to(1)
                expect {
                    post tweet_likes_path(tweet)
                }.to change { Like.count }.from(1).to(0)
                expect(tweet.reload.likes_count).to eq(0)
            end
        end
     
    end
end