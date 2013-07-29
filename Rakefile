require 'rubygems'
require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'active_record'
require 'rspec/core/rake_task'

namespace :db do
  
  desc 'Migrate the db'
  task :migrate do
    ActiveRecord::Base.establish_connection(adapter:'sqlite3', database:'db/test.sqlite3')
    ActiveRecord::Migrator.migrate('db/migrate/')
  end

end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.fail_on_error = false
  t.rspec_opts = %w{--format documentation --color}
end

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end
