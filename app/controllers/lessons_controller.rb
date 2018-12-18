class LessonsController < ApplicationController

    def show
        @lesson = Lesson.find(params[:id])
        @category = Category.find_by(id: @lesson.category_id)
        @words = @lesson.words.all
        @choices = @lesson.choices.all
       
    end

    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.save
        redirect_to new_lesson_answer_path(@lesson)
    end
        

    private

    def lesson_params
        params.permit(:category_id).merge(user_id: current_user.id)
    end
end
