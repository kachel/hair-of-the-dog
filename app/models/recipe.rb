class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :ratings
  has_many :commenting_users, through: :comments, source: :users
  has_many :rating_users, through: :ratings, source: :users
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :directions
  accepts_nested_attributes_for :directions
  accepts_nested_attributes_for :ingredients
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :ratings
  default_scope { order(title: :asc) }

  def self.servings
    unscope(:order).order(servings: :asc)
  end
end
