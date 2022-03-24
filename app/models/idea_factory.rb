class IdeaFactory < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  validates :title, presence: { message: "title must be provided" }, uniqueness: true
  validates :description, presence: true, length: { minimum: 20 }
end
