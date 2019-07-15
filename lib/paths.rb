require 'yaml'
require 'sequel'
require "./lib/router"

DB = Sequel.connect(adapter: :sqlite, database: 'dev.sqlite3')
Sequel.extension :migration
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '*.rb')].each { |file| require file }
Sequel::Migrator.run(DB, File.join(File.dirname(__FILE__), '..', 'db', 'migrations'))
Dir[File.join(File.dirname(__FILE__), '..', 'app', '**', '*.rb')].each { |file| require file }
ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), '..', 'app', 'routes.yml')))
