class AnswersController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @category = Category.find_by(id: @lesson.category_id)
    @choices = @lesson.next_word.choices.all

    @answer = Answer.new 
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @answer = @lesson.answers.build(answer_params)
    @answer.save
    
    if !@lesson.next_word.nil?
      redirect_to new_lesson_answer_url(@lesson)
    else
      @lesson.update(result: @lesson.correct_choice)
      redirect_to lesson_path(@lesson)
    end
    
  end


  private
  def answer_params
    params.permit(:choice_id, :word_id, :lesson_id)
  end

end