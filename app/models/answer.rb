class Answer < ApplicationRecord
    belongs_to :word
    belongs_to :choice
    belongs_to :lesson

    #Answer >- Lesson >- Category
    has_many :categories, through: :lesson
    #Answer >- Lesson >- User 
    has_many :users, through: :lesson

end