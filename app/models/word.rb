class Word < ApplicationRecord
    belongs_to :category

    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices

    has_many :answers

    validates :category_id, presence: true
    validates :word, presence: true, length: { maximum: 30 }
end

