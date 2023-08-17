# frozen_string_literal: true

require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    base_uri = 'https://api.spoonacular.com/recipes'
    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}/1/information?apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}")
      .to_return(status: 200, body: '{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='gluten free'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='vegetarian'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='gluten free,vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='vegetarian,vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='gluten free,vegetarian'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    # Stub GET request to Spoonacular API
    stub_request(:get, "#{base_uri}//complexSearch?diet='gluten free,vegetarian,vegan'&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')

    stub_request(:get, "#{base_uri}//complexSearch?query=rice&apiKey=#{ENV.fetch('SPOONACULAR_API_KEY')}&number=20")
      .to_return(status: 200, body: '{"results":[{"id":1,"title":"Rice Cannellini Bean and Asparagus Salad with Mushrooms","image":"spec/fixtures/rice.jpg","imageType":"jpg"},{"id":2,"title":"Rice Cauliflower, Brown Rice, and Vegetable Fried Rice","image":"spec/fixtures/rice.jpg","imageType":"jpg"}]}')
  end
end
