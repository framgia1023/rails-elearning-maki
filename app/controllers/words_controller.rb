class WordsController < ApplicationController

def index
    @user = User.find(params[:user_id])
    @select = @user.learned_words.pluck(:title) << "All"


    if params[:title] == "All" || params[:title].nil?
        @lessons = @user.lessons
        @category = "All"
    else
        @lessons = @user.lessons.joins(:category).where("title = ?", params[:title])
        @category = Category.find_by(title: params[:title]).title 
    end
    
end

end



