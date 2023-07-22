require 'rails_helper'


RSpec.describe "Homes", type: :request do
    describe "GET /index" do
        let (:user) { create(:user)}
        
        context "if signed in" do
            it "redirects to username page if there is no username and display name" do
                sign_in user
                get root_path
                expect(response).to have_http_status(:redirect)
                expect(response).to redirect_to(new_username_path)
            end
            it "redirects to dashboard path if username and display name exists" do
                user_with_username = create(:user, username: "username", display_name: "abiodun")
                sign_in user_with_username
                get root_path
                expect(response).to have_http_status(:redirect)
                expect(response).to redirect_to(dashboard_index_path)
            end
        end
        context "if signed out" do
            it "renders home page successful" do
                get root_path
                expect(response).to have_http_status(:success)
            end
        end
    end
end