class DashboardController < ApplicationController
    before_action :authenticate_user!

    def index
      @tweets = Tweet.includes(:user).newest_first
    end
end