require 'rails_helper'


RSpec.describe "Homes", type: :request do
    describe "GET /index" do
        let (:user) { create(:user)}

        context "when signed in" do
            it "it redirects to dashboard page" do
                sign_in user
                get dashboard_index_path
                expect(response).to have_http_status(:success)
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