class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :commenting_users, through: :comments, source: :users
  has_many :rating_users, through: :ratings, source: :users
  has_many :ingredients
  has_many :directions
  accepts_nested_attributes_for :directions
  accepts_nested_attributes_for :ingredients
end
