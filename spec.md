# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (User has_many Recipes, Ratings, and Comments)
- [x] Include at least one belongs_to relationship (Comments belongs_to User and Recipe)
- [x] Include at least two has_many through relationships (User has_many :commenting_users, through: :comments, source: :users)
- [x] Include at least one many-to-many relationship (recipe and ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (comment has content, ratings have stars)
- [x] Include reasonable validations for simple model objects (Ingredients must be unique)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login (OmniAuth)
- [x] Include nested resource show or index (recipe_comment)
- [x] Include nested resource "new" form (new_recipe_rating)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
