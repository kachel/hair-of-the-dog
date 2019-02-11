class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :servings, :title, :directions, :ingredients
  belongs_to :user
end
