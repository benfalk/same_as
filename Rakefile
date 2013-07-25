require 'rubygems'
require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'active_record'

namespace :db do
  
  def connection_details
    {
        adapter: 'sqlite3',
        database: 'db/test.sqlite3'
    }
  end

  desc 'Migrate the db'
  task :migrate do
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migrator.migrate('db/migrate/')
  end

  desc 'Create the db'
  task :create do
    # TODO: this is probably just a migrate
    # ActiveRecord::Base.establish_connection(connection_details)
    # ActiveRecord::Base.connection.create_database(connection_details.fetch(:database))
  end

  desc 'drop the db'
  task :drop do
    # TODO: need to just delete the file
    # ActiveRecord::Base.establish_connection(connection_details)
    # ActiveRecord::Base.connection.drop_database(connection_details.fetch(:database))
  end
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end
