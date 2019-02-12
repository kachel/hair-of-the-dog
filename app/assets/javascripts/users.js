// purposeful root level function declaration

function prevRecipeClick() {
  const userId = parseInt($('h2').attr('data-user-id'))
  const recipeId = parseInt($('h3').attr('data-recipe-id'))
  $.get('/users/' + userId + '.json', function(resp) {
    const recipes = resp.recipes

    const recipeIds = recipes.map(recipe => recipe.id)

    const prevRecipeIndex = recipeIds.indexOf(recipeId) - 1

    if (prevRecipeIndex >= 0) {
      const prevRecipe = recipes[prevRecipeIndex]

      $('.recipeTitle').text(prevRecipe['title'])
      $('.recipeServings').text('(serves ' + prevRecipe['servings'] + ')')
      $('ul').empty()
      prevRecipe.ingredients.map(ingredient =>
        $('ul').append('<li>' + ingredient.name + '</li>'),
      )
      $('recipeDescription').text(prevRecipe['description'])
      $('ol').empty()
      prevRecipe.directions.map(direction =>
        $('ol').append('<li>' + direction.body + '</li>'),
      )
      $('h3').attr('data-recipe-id', prevRecipe['id'])
    } else {
      window.alert('No more recipes')
    }
  })
}
