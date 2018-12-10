class Admin::CategoriesController < AdminController
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "Successfully created new category."
            redirect_to new_admin_category_url
        else
            render 'new'
        end
    end

    def new
        @category = Category.new
    end

    private
    def category_params
        params.require(:category).permit(:title, :description)
    end

end
