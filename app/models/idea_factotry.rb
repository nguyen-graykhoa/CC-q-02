class IdeaFactotry < ApplicationRecord
  belongs_to :user

  validates :title, presence: { message: "title must be provided" }, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
end
