class Admin::WordsController < AdminController
before_action :find_category

  def new
    @word = @category.words.new
    3.times do
    @word.choices.build
    end
  end

  def create
    @word = @category.words.new(word_params)
    if @word.save
        redirect_to admin_category_words_url(@category)
    else
        render 'new'
    end
  end

  def index
    @words = @category.words.order('created_at desc').paginate(page: params[:page], per_page: 10)
  end

  def edit
    @word = @category.words.find(params[:id])
  end

  def update
    @word = @category.words.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Successfully updated word."
      redirect_to admin_category_words_url (@category)
    else
      render 'edit'
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy
    redirect_to admin_category_words_url (@category)
  end

  private
  def find_category
      @category = Category.find(params[:category_id])
  end

  def word_params
  params.require(:word).permit(:word, choices_attributes: [:id, :choice, :correct])
  end

end