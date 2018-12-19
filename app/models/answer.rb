class Answer < ApplicationRecord
    belongs_to :word
    belongs_to :choice
    belongs_to :lesson

    has_many :categories, through: :lesson
    has_many :users, through: :lesson

end