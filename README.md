# README

### Sweater Weather is an API designed to provide forecast information for a given future destination

## Ruby version:
- 2.4.1

## API Requirements:
- GOOGLE_API_KEY
- DARK_SKY_API_KEY
- UNSPLASH_ACCESS_KEY
- UNSPLASH_SECURITY_KEY

## Database creation
- PostgreSQL 

## Database initialization:
- $ rails db:{:create, :migrate}

## How to run the test suite:
- $ rspec (or bundle exec rspec)

## Services:
- Google API used for mapping and global logistics, directions
- Dark Sky API used for forecasting information based on global logistics
- Unsplash API used for images 

## Request Examples:
* GET "/api/v1/forecast?location=denver,co
- Sends forecast information for a given location

* GET "/api/v1/backgrounds?location=denver,co
- Sends a an image URL for a given location

* POST "/api/v1/users?email=email@example.com&password=password&password_confirmation=password
- Creates a new user

* POST "/api/v1/sessions?email=email@example.com&password=password&api_key=key
- Creates a new session for a given user

* POST "/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=key
- Creates a new road trip for the user for a given origin and destination
