# frozen_string_literal: true

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    base_uri = 'https://api.spoonacular.com/recipes'
    response_data = [
      { id: 1, title: 'Cannellini Bean and Asparagus Salad with Mushrooms', image: 'spec/fixtures/rice.jpg',
        imageType: 'jpg' },
      { id: 2, title: 'Cauliflower, Brown Rice, and Vegetable Fried Rice', image: 'spec/fixtures/rice.jpg',
        imageType: 'jpg' }
    ]
    response = { 'results' => response_data }.to_json

    stub_request(:get, "#{base_uri}/complexSearch?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20&query=")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })
    stub_request(:get, "#{base_uri}/1/information?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}")
      .to_return(status: 200, body: { "id": 1, "title": 'Cannellini Bean and Asparagus Salad with Mushrooms',
                                      "image": 'spec/fixtures/rice.jpg', "imageType": 'jpg',
                                      'extendedIngredients' => [
                                        { 'original' => 'Ingredient 1' },
                                        { 'original' => 'Ingredient 2' }
                                        # Add more ingredients as needed
                                      ],
                                      'instructions' => 'Instructions for the recipe.' }.to_json, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&diet=&number=20&query=")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?diet='vegetarian'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?diet='vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?diet='gluten free,vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?diet='vegetarian,vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?diet='gluten free,vegetarian'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?diet='gluten free,vegetarian,vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: response, headers: { 'Content-Type': 'application/json' })

    stub_request(:get, "#{base_uri}/complexSearch?query=rice&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: { "results": [
        { "id": 1, "title": 'Rice Cannellini Bean and Asparagus Salad with Mushrooms', "image": 'spec/fixtures/rice.jpg',
          "imageType": 'jpg' }, { "id": 2, "title": 'Rice Cauliflower, Brown Rice, and Vegetable Fried Rice', "image": 'spec/fixtures/rice.jpg', "imageType": 'jpg' }
      ] }.to_json, headers: { 'Content-Type': 'application/json' })
  end
end
