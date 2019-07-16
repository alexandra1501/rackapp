ENV["RACK_ENV"] = 'test'
require './app'
require 'minitest/autorun'
require 'rack/test'
YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml')))
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each {|file| require file }

module MyBuilder
  include Rack::Test::Methods
  def app
    builder = Rack::Builder.new
    builder.run App.new
  end
end
