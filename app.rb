require 'yaml'

DB = Sequel.connect(adapter: :sqlite, database: 'dev.sqlite3')
Sequel.extension :migration

Dir[File.join(File.dirname(__FILE__), 'lib', '*.rb')].each { |file| require file }

Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), 'db', 'migrations'))

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each { |file| require file }

ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), 'app', 'routes.yml')))

require "./lib/router"

class App

  attr_reader :router

  def initialize
    @router = Router.new(ROUTES)
  end

  def call(env)
    result = router.resolve(env)
    [result.status, result.headers, result.content]
  end

  def self.root
    File.dirname(__FILE__)
  end

end
