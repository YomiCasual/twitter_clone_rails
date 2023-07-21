require 'rails_helper'


RSpec.describe "Homes", type: :request do
    describe "GET /index" do
        let (:user) { FactoryBot.create(:user, email: "yomionisade@gamil.com", password: 'password')}

        context "when signed in" do
            it "it redirects to sign in page" do
                sign_in user
                get dashboard_index_path
                expect(response).to have_http_status(:success)
            end
        end
        
        context "when not signed in" do
            it "it redirects to sign in page" do
                get dashboard_index_path
                expect(response).to have_http_status(:redirect)
            end
        end
    end
end