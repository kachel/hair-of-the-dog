class User < ApplicationRecord
  has_many :recipes
  has_many :comments
  has_many :commented_recipes, through: :comments, source: :recipes
  has_many :rated_recipes, through: :ratings, source: :recipes
  has_secure_password

  validates :email, presence: true
  validates :email, uniqueness: true

  def self.find_or_create_by_omniauth(auth_hash)
    if auth_hash["uid"].nil?
      # auth fails // deny access to app
      nil
    elsif email = auth_hash["info"]["email"]
      User.find_or_create_by(email: email, github_id: auth_hash["uid"])
    else
      # omniauth emails are sometimes omitted.
      # redirect to page asking email info.
      user = User.find_or_create_by(github_id: auth_hash["uid"])
      user.save(validate: false)
      user
    end
  end

  def self.find_or_create_by_email(params)
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      user
    else
      nil
    end
  end

end # class User
