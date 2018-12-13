class Word < ApplicationRecord
    belongs_to :category

    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices

    has_many :answers

    validates :category_id, presence: true
    validates :word, presence: true, length: { maximum: 30 }
    validate :check_choice

    def correct_answer
        choices.find_by(correct: true)  
    end

    private

    def check_choice
        correct = choices.collect { |c| c.correct || nil}.compact
        if correct.compact.size == 0
        #もし一つしか選んでなかったら、array{true, nil nil}になる
        errors.add(:base, 'You must select at least one answer') 
        elsif correct.compact.size > 1
        errors.add(:base, 'You can select only one') 
        end

    end

    #.collect  
    #.compact
    #.size
    #.count == 1
    # if choice.any? /choice.count?
      
    # elsif

    # end

end

