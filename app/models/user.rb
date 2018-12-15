class User < ApplicationRecord
  has_many :recipes
  has_many :commented_recipes, through: :comments, source: :recipes
  has_many :rated_recipes, through: :ratings, source: :recipes
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  # inspired by Devise User#from_omniauth
  def self.find_or_create_by_omniauth(auth_hash)
    where(email: auth_hash["info"]["email"]).first_or_create do |u|
      u.password = SecureRandom.hex
    end
  end

end # class User
