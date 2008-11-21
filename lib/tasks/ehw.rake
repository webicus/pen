# rake task to load initial data.  Call with rake db:seed
namespace :db do
  task :seed => :environment do #loads rail env.
    desc "populate the database with seed data from db/fixtures."
    puts "Seeding the database..."
    require 'active_record/fixtures'
    Dir.glob(RAILS_ROOT + '/db/fixtures/*.yml').each do |file|
      Fixtures.create_fixtures('db/fixtures', File.basename(file, '.*'))
    end
    
  end
  task :refresh => [:drop, :create, :migrate, :seed] do
    desc "drop/create/migrate and seed database."
    puts "Completed refresh at " + Time.now.to_s
  end
end





task :greet1 do
  puts "hello "
end
task :greet => :greet1 do
  desc "hello world example with dependencies."
  puts "world"
          puts "Completed refresh at " + Time.now.to_s
end
