class User < ApplicationRecord
    has_secure_password
    has_many :idea_factories, dependent: :destroy
    has_many :reviews, dependent: :destroy
    
    has_many :likes, dependent: :destroy
    has_many :liked_idea_factories, through: :likes, source: :idea_factory
    
    def full_name
        self.first_name + " " + self.last_name
    end
end
