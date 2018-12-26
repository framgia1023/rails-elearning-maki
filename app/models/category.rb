class Category < ApplicationRecord
    validates :title, presence: true, length: { maximum: 60 }
    validates :description, presence: true, length: { maximum: 60 }
#Category -< Words
    has_many :words, dependent: :destroy
#User -< Lesson >- Category
    has_many :lessons, dependent: :destroy
    has_many :users, through: :lessons

#Category -< Lesson -< Answer
    has_many :answers, through: :lessons


end
