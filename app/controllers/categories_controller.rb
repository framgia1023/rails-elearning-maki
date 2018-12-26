class CategoriesController < ApplicationController
    def index
        @learned = current_user.categories.where.not(lessons: {result: nil}).group(:id)
                    .paginate(page: params[:page], per_page: 6).order('created_at desc')

        @all = Category.joins(:words).group(:id)
               .paginate(page: params[:page], per_page: 6).order('created_at desc')

        @lesson = Lesson.new 

        if params[:status] == "learned"
            @categories = @learned
        elsif params[:status] == "unlearned"
            unlearned = (@all - @learned)
            @categories = Category.where(id: unlearned.map{ |u| u.id })
                         .paginate(page: params[:page], per_page: 6).order('created_at desc')
        else
            @categories = @all
        end
           
    end

    
end
