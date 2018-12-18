class Choice < ApplicationRecord
    has_many :answers
    has_many :lessons, through: :answers
    
    belongs_to :word
    validates :choice, presence: true, length: { maximum: 30 }
end
