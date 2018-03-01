require 'active_record'
require 'logger'
require 'yaml'
require './model'

# ActiveRecord::Base.logger = Logger.new('debug.log')
configuration = YAML::load(IO.read('config/database.yml'))

ActiveRecord::Base.establish_connection(configuration['development'])
