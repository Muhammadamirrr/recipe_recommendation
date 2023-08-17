class SpoonacularService
  include HTTParty
  base_uri 'https://api.spoonacular.com/recipes'

  def self.fetch_recipes(query)
    response = get("/complexSearch?query=#{query}&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=10")
    response.parsed_response['results'] if response.success?
  end

  def self.fetch_recipe(recipe_id)
    response = get("/#{recipe_id}/information?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}")
    response.parsed_response if response.success?
  end
end
