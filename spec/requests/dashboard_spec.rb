require 'rails_helper'


RSpec.describe "Dashboard", type: :request do
    describe "GET /dashboard" do
        let (:user) { create(:user)}

        context "when signed in without username or display name" do
            it "it redirects to username page" do
                sign_in user
                get dashboard_index_path
                expect(response).to redirect_to(new_username_path)
                expect(response).to have_http_status(:redirect)
            end
        end
        context "when signed in with username and display name" do
            it "it redirects to dashobard page" do
                user_with_username = create(:user, username: "username", display_name: "display")
                sign_in user_with_username
                get dashboard_index_path
                expect(response).to have_http_status(:success)
                # expect(response).to have_http_status(:success)
            end
        end
        
        context "when not signed in" do
            it "it redirects to sign in page" do
                get dashboard_index_path
                expect(response).to have_http_status(:redirect)
                expect(response).to redirect_to(new_user_session_path)
            end
        end
    end
end