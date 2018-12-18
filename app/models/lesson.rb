class Lesson < ApplicationRecord
    has_many :answers
    has_many :words, through: :answers
    has_many :choices, through: :answers

    belongs_to :user
    belongs_to :category

def next_word
    (category.words - words).first
end

def current_number
    current_number = words.count
    current_number += 1
end

def correct_choice
    choices.where(correct: true).count
end

#このメソッドをここに入れるのは直接lessonからdirectにもらえるからだって、、

end