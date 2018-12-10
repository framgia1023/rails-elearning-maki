class AdminController < ApplicationController
before_action :require_admin

    def require_admin
        unless current_user.admin?
            flash[:danger] = "Sorry, You're not allowed to enter this page."
            redirect_to(root_url) 
        end
    end

end