class User < ApplicationRecord
     #User -< Activity
    has_many :activities

    validates :name, presence: true, length: { maximum: 25, minimum: 2 }

    before_save { email.downcase! }
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                                      format: { with: EMAIL_REGEX },
                                      uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 6 }, allow_nil: true

    mount_uploader :picture, PictureUploader

    #User -< Lesson >- Category
    has_many :lessons, dependent: :destroy
    has_many :categories, through: :lessons

    #User -< Lesson -< Answer
    has_many :answers, through: :lessons


    #User -< Relationship
    has_many :active_relationships,  class_name: 'Relationship',
                                     foreign_key: 'follower_id',
                                     dependent: :destroy

    has_many :following, through: :active_relationships, source: :followed

    has_many :passive_relationships, class_name: 'Relationship',
                                    foreign_key: 'followed_id',
                                    dependent: :destroy

    has_many :followers, through: :passive_relationships, source: :follower


    def follow(other_user)
        following << other_user
    end

    def unfollow(other_user)
        following.delete(other_user)
    end

    def following?(other_user)
        following.include?(other_user)
    end

    def learned_word
        lessons.sum(:result)
    end

    def learned_words
        categories.where.not(lessons: {result: nil})
    end

    def dashboard_feed
        following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
        Activity.where("user_id IN (#{ following_ids }) OR user_id = :user_id",
                        following_ids: following_ids, user_id: id)
    end

    def self.search(search) 
        if search
          where(['name LIKE ?', "%#{search}%"]) 
        else
          all 
        end
    end
    
end
