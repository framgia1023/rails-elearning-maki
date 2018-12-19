class WordsController < AdminController

def index
    @user = User.find(params[:user_id])
    @lesson = Lesson.find_by(user_id: @user)
    @categories = @user.categories
    answers = @user.answers
end
end