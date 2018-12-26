class WordsController < ApplicationController

def index
    @user = User.find(params[:user_id])
    @select = @user.categories.where.not(lessons: {result: nil}).pluck(:title)

    if params[:title].present?
        @lessons = @user.lessons.joins(:category).where("title = ?", params[:title])
        @category = Category.find_by(title: params[:title]).title 
    else 
        @lessons = @user.lessons
        @category = "All"
    end
    
end

end



