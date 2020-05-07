# frozen_string_literal: true

require 'rubygems'
require 'bundler'
require 'dotenv/load'
require 'pry'

Dotenv.load('config/aws.env')
Bundler.require

require './lib/hash_builder.rb'
require './lib/hash_builder.rb'
require './application/cognito/params/default.rb'
require './application/cognito/params/login.rb'
require './application/cognito/params/init_password.rb'
require './application/application.rb'
run Application
