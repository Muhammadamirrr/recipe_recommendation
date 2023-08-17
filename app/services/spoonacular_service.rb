class SpoonacularService
  include HTTParty
  base_uri 'https://api.spoonacular.com/recipes'

  def self.fetch_recipes(preference, query)
    preference_query = ''
    if preference.present?
      preference_query = "&diet=#{preference.gluten_free ? 'gluten free,' : ''}#{preference.vegetarian ? 'vegetarian,' : ''}#{preference.vegan ? 'vegan' : ''}"
    end

    response = get("/complexSearch?#{preference_query}&query=#{query}&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
    response.parsed_response['results'] if response.success?
  end

  def self.fetch_recipe(recipe_id)
    response = get("/#{recipe_id}/information?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}")
    response.parsed_response if response.success?
  end
end
