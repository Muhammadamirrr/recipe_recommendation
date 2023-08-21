# Recipe Recommendation Platform
The Recipe Recommendation Platform is a Ruby on Rails (RoR) 7 web application that allows users to discover, and receive personalized recipe recommendations. The application integrates with the Spoonacular API, a public API that provides access to a vast collection of recipes, ingredients, and nutritional information.

**Key Features:**
- User Registration
- Recipe Search and Discovery
- Spoonacular API Integration
- Personalized Recipe Recommendations based on preferences
- Recipe Details and Nutritional Information
- Complete test coverage


**Technical Implementation:**
- Ruby on Rails 7
- Docker
- Rspec, Capabara
- Spoonacular API Integration
- JSON Distribution

# Stack

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [Capabara](https://teamcapybara.github.io/capybara/)

## Prerequisites
Before you begin, ensure you have met the following requirements:
- Docker and Docker Compose are installed on your system.
## Local Setup To run the application locally without Docker, follow these steps:
1. Clone the repository:
```bash
    git clone https://github.com/Muhammadamirrr/recipe_recommendation.git cd recipe_recommendation
```
2. Install dependencies:
 ```bash
    bundle install
 ```
3. Set up the database:
 ```bash
    rails db:create
    rails db:migrate
 ```
4. Start the Rails server::
 ```bash
    rails server
 ```
5. Access the application in your web browser: http://localhost:3000:
    - Use the provided web interface to view, filter recipes bases on preferences
    - The app also comes with a simple user authentication system.
3. To run the RSpec tests:
 ```bash
    rspec
 ```

## Docker Setup

To run the application using Docker, follow these steps:

1. Clone the repository:
2. Create a .env file for environment variables (replace with your values):
3. Edit the .env file and provide your PostgreSQL database configuration.

Build and start the Docker containers
```bash
    docker-compose build
    docker-compose up
```
4. The Rails app will be accessible at http://localhost:3000.
5. Set up the database:

```bash
    docker-compose exec app rails db:create
    docker-compose exec app rails db:migrate
```
6. Access the Rails console:
```bash
    docker-compose exec app rails console
```
7. To run the RSpec tests:
```bash
    docker-compose exec app rspec
```
## Cleaning Up
To stop and remove the Docker containers and volumes, use:
```bash
docker-compose down -v
```
