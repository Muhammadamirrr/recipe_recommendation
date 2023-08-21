# frozen_string_literal: true

require 'webmock/rspec'
require_relative 'json_error_handler'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    base_uri = 'https://api.spoonacular.com/recipes'
    api_key = ENV.fetch('SPOONACULAR_API_KEY')
    headers = { 'Content-Type': 'application/json' }
    response_data = {}

    begin
      json_content = File.read(Rails.root.join('spec', 'fixtures', 'spoonacular_response.json'))
      response_data = JSON.parse(json_content)
    rescue StandardError => e
      JSONErrorHandler.handle_error(e)
    end

    stub_request(:get, "#{base_uri}/1/information?apiKey=#{api_key}")
      .to_return(status: 200, body: response_data['singleResource'].to_json, headers:)

    stub_request(:get, "#{base_uri}/complexSearch?apiKey=#{api_key}&diet=&number=20&query=")
      .to_return(status: 200, body: { "results": response_data['default'] }.to_json, headers:)

    stub_request(:get, "#{base_uri}/complexSearch?apiKey=#{api_key}&diet=&number=20&query=rice")
      .to_return(status: 200, body: { "results": response_data['searchResponse'] }.to_json, headers:)
  end
end
