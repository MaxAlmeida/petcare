# README

## How to run the project?
#### 1 - Check if you have everything set up ( linux )
- MySql is installed
- Rails 5.2.4.4 is installed
- Ruby 2.6.5 is installed
#### 2 - Change DB settings
- Check Database credentials on `config/database.yml` ( add password on development and test for mysql if you have one set )
#### 3 - Run initial commands
- install gems `bundle install` 
- Create Database - `rails db:create`
- Create Tables - `rails db:migrate`
- Populate database with pets - `rake db:seed `
- Run Tests - `bundle exec rspec`
#### 4 - Start Server
- Start up local server - `rails s`
