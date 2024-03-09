# README

minimalist Journal App#

This README provides information on how to set up and configure, and run this Ruby on Rails application.

## Table of Contents

- [Ruby Version](#ruby-version)
- [System Dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Database](#database)
- [Database Initialization](#database-initialization)
- [Test Suite](#how-to-run-the-test-suite)

## Ruby Version

This application was built using Ruby version 3.3.

## System Dependencies

Ensure that your system meets the following dependencies:

1. **Ruby Version:**
   - This application was built using Ruby 3.3. 

2. **Database:**
   - PostgreSQL 16.1.

3. **Gems:**
   - Check the Gemfile for a list of required gems. You can install them using Bundler: `bundle install`.

## Configuration

### Devise for Authentication

This app uses [Devise](https://github.com/heartcombo/devise) for user authentication. 
For the detailed configuration options and customization, refer to the [Devise Github](https://github.com/heartcombo/devise) or [Devise documentation](https://www.rubydoc.info/gems/devise/2.2.8) website.

## Database Creation

Run the command to create the database: `rails db:create`

## Database Initialization

Run the migrations to setup the database schema: `rails db:migrate`

## How to run the Test Suite

To run the test suite for this application, use the command: `bin/rails test`