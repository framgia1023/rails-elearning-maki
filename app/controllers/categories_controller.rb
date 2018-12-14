class CategoriesController < ApplicationController
    def index
        @categories = Category.joins(:words).group(:category_id).paginate(page: params[:page], per_page: 4)
    end
end
