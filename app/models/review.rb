class Review < ApplicationRecord
  belongs_to :user
  belongs_to :idea_factory
end
