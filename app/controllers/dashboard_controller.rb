class DashboardController < AdminController

    def index
        @lesson = Lesson.find_by(user_id: current_user)
    end
end