# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'aws-sdk-cognitoidentity'
gem 'aws-sdk-cognitoidentityprovider'
gem 'aws-sdk-cognitosync'
gem 'dotenv'
gem 'racksh'
gem 'sinatra'
gem 'thin'

group :development do
  gem 'brakeman'
  gem 'rubocop', require: false
end

group :development, :test do
  gem 'pry', '~> 0.12.2'
end
