require 'rails_helper'


RSpec.describe "Username", type: :request do
    let (:user) { create(:user)}
    before { sign_in user}

    describe "GET new" do
            it "successfully renders username page" do
                get new_username_path
                expect(response).to have_http_status(:success)
            end
    end
        
    describe "PUT update" do
            it "username and redirect to dashboard" do
                sign_in user
                    put username_path(user), params: {
                        username: { username: "bodaq"}
                    } 
                expect(user.username).to eq("bodaq")
                expect(response).to redirect_to(dashboard_index_path)
            end
        end
        
end