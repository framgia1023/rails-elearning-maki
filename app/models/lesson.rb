class Lesson < ApplicationRecord
    #Lesson -< Activity (Polymorphic)
    has_one :activity, as: :action, dependent: :destroy

    has_many :answers
    #Lesson -< Answer >- Word
    has_many :words, through: :answers
    #Lesson -< Answer >- Choice
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



end