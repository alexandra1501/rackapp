ENV["RACK_ENV"] = 'test'
require './app'
YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml')))
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each {|file| require file }
require 'minitest/autorun'
require 'rack/test'
require 'test/unit'
