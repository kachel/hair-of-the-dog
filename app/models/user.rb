class User < ApplicationRecord
  has_many :recipes
  has_many :comments, through: :recipes
  has_many :ratings, through: :recipes
  has_secure_password
end
