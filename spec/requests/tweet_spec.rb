require 'rails_helper'


RSpec.describe "Tweet", type: :request do

    describe "Create tweet" do 
        context "When not logged in" do 
            it "should throw error" do 
                expect {
                    post tweet_index_path , params: { tweet: { body: "new tweet" } }
                }.to change { Tweet.count }.by(0)

            end
        end

        context "When logged in" do 
            it "should throw error" do 
                user = create(:user, username: "username")
                sign_in user
                expect {
                    post tweet_index_path , params: { tweet: { body: "new tweet" } }
                }.to change { Tweet.count }.from(0).to(1)

                expect(Tweet.first.user.as_json).to eq(user.as_json)

            end
        end

    end


end