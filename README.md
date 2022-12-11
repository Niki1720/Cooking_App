# Cooking App

Cooking App is an application created while learning to code in Ruby on Rails.
It allows the logged-in user to view recipes created by other users, as well as to add their own recipes.
The app is under development.

Rails version `6.1`.
Ruby version `3.1`.
# Getting started

To get the Rails server running locally:

* Clone this repo
* `bundle install` to install all req'd dependencies
* `rake db:migrate` to make all database migrations
* `rails s` to start the local server

### Used gems:
* `carrierwave`
* `mini_magick`
* `fog`
* `devise`
* `will_paginate`


##### Resource

Table creation and model with validation:
* Users 
* Recipes
* Ingredients
* Units
* Images

#### Associations
* One-to-many between users and recipes
* One-to-one between users and images
* Many-to-many between recipes and ingredients
* One-to-many between units and ingredients


#### Authentication

* Login using secure password

#### Restriction of actions

* Based on logged in/logged out state

#### Security

* Admin user functionality and access level