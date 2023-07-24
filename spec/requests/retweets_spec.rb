require 'rails_helper'


RSpec.describe "Retweets", type: :request do
    describe "CREATE /retweets" do
        let (:user) { create(:user, username: "usernamke")}
        let (:tweet) { create(:tweet, user: user)}

        context "When user tries to retweet a new post" do
            it "it should retweet successfully" do
                sign_in user
                expect {
                    post tweet_retweets_path(tweet)
                }.to change { Retweet.count }.from(0).to(1)
                expect(tweet.reload.retweet_users.size).to eq(1)
            end
        end

        context "Should remove a retweet from a retweeted post" do
            it "it should unretweet successfully" do
                sign_in user
                expect {
                    post tweet_retweets_path(tweet)
                }.to change { Retweet.count }.from(0).to(1)
                expect {
                    post tweet_retweets_path(tweet)
                }.to change { Retweet.count }.from(1).to(0)
                expect(tweet.reload.retweet_users.size).to eq(0)
            end
        end
     
    end
end