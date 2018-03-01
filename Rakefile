require './app'
include ActiveRecord::Tasks

namespace :db do
  desc "Create DB"
  task :create do
    DatabaseTasks.create_current('development')
  end

  desc "Run migrations"
  task :migrate do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
  end
end
