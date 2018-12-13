class Admin::CategoriesController < AdminController
    def create
      @category = Category.new(category_params)
      if @category.save
          flash[:success] = "A new category has been added."
          redirect_to admin_categories_url
      else
          render 'new'
      end
    end

    def new
      @category = Category.new
    end
    
    def show
      @category = Category.find(params[:id])
    end


    def index
      @categories = Category.paginate(page: params[:page], per_page: 10).order('created_at DESC')
      
    end

    def edit
      @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update_attributes(category_params)
        flash[:success] = "Successfully updated category."
        redirect_to admin_categories_path
      else
        render 'edit'
      end
    end 

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_url
    end

    private
    def category_params
        params.require(:category).permit(:title, :description)
    end

end
