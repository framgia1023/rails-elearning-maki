class Category < ApplicationRecord
    validates :title, presence: true, length: { maximum: 25, minimum: 2 }
end
