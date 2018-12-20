class Choice < ApplicationRecord
    has_many :answers
    #Choice -< Answer >- Lesson
    has_many :lessons, through: :answers
    
    belongs_to :word
    validates :choice, presence: true, length: { maximum: 30 }
end
