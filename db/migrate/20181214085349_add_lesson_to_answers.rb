class AddLessonToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :lesson, foreign_key: true
  end
end
  