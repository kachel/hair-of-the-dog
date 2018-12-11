class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :users
  has_many :ratings, through: :users
  has_many :ingredients
end
