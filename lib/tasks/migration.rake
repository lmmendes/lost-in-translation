namespace :lost_in_translation do
  namespace :db do
    description = "Lost in Translation Migration"
    desc description
    task :migrate => :environment do
      migration_files_path = File.expand_path(File.join(File.dirname(__FILE__), '..', 'db', 'migrate'))
      $stdout.puts "Running migrations from #{ migration_files_path }"
      ActiveRecord::Migration.verbose = ENV['VERBOSE'] ? ENV['VERBOSE'] == 'true' : true
      ActiveRecord::Migrator.migrate( migration_files_path , ENV['VERSION'] ? ENV['VERSION'].to_i : nil)
      # Rake::Task['db:schema:dump'].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end
end
