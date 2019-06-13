require 'bundler'
require 'rubygems'
Bundler.require

require './app'

 # use Rack::Reloader, 0
  run App.new
