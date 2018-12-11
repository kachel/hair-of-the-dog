class User < ApplicationRecord
  has_many :recipes
  has_many :posts, through: :recipes
  has_secure_password
end
