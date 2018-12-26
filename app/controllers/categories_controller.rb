class CategoriesController < ApplicationController
    def index
        @lesson = Lesson.new 

        if params[:status] == "learned"
            @categories = current_user.learned_words
                          
        elsif params[:status] == "unlearned"
            ids = current_user.learned_words.pluck(:id)
            @categories = Category.where.not(id: ids)  
        else
            @categories = Category.all
                       
        end
           
        @categories = @categories.joins(:words).group(:id).paginate(page: params[:page], per_page: 6).order('created_at desc')

    end

    
end
