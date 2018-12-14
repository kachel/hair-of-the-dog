class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments, through: :users
  has_many :ratings, through: :users
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :directions
  accepts_nested_attributes_for :ingredients
  
end
