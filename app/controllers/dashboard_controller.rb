class DashboardController < ApplicationController

    def index
        @activities = current_user.dashboard_feed.paginate(page: params[:page], per_page: 8).order('created_at DESC')
    end

end