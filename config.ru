require 'rubygems'
require 'bundler'
require 'dotenv/load'

Dotenv.load('config/aws.env')
Bundler.require

require './application.rb'
run Application