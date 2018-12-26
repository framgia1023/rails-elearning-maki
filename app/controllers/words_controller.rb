class WordsController < ApplicationController

def index
    @user = User.find(params[:user_id])
    @select = @user.learned_words.where.not(title: params[:title]).pluck(:title) 


    if params[:title] == "All" || params[:title].nil?
        @lessons = @user.lessons
        @category = "All"
    else
        @lessons = @user.lessons.joins(:category).where("title = ?", params[:title])
        @category = Category.find_by(title: params[:title]).title 
        @select = @select << "All"
    end
    
end

end



