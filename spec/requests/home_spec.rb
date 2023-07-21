require 'rails_helper'


RSpec.describe "Homes", type: :request do
    describe "GET /index" do

        let (:user) { FactoryBot.create(:user, email: "yomionisade@gamil.com", password: 'password')}
        
        # before do
        #     allow(controller).to receive(:authenticate_user!).and_return(true)
        # end
        it "renders home page successful" do
            sign_in user
            get "/"
            expect(response).to have_http_status(200)
        end
    end
end