require 'rubygems'
require 'dotenv'
require 'sinatra'
require 'require_all'
require 'active_record'
require 'pry'

Dotenv.load
require_all './models/active_record/*rb'
require_all './services/*rb'
require_all './services/*/*rb'
require_all './config/initializer/*rb'
require './app/app.rb'