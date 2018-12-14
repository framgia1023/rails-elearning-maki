class Category < ApplicationRecord
    has_many :words, dependent: :destroy
    validates :title, presence: true, length: { maximum: 60 }
end
