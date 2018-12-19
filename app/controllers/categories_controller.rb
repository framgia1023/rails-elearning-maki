class CategoriesController < ApplicationController
    def index
        @categories = Category.joins(:words).group(:id).paginate(page: params[:page], per_page: 6).order('created_at desc')
        @lesson = Lesson.new
    end

    
end
