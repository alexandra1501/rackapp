require 'yaml'
require 'bundler'
require 'rubygems'

Bundler.require

require './app'

run App.new
