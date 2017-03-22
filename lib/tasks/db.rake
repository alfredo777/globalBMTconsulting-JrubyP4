namespace :db do
  task :migrate do
  	puts "Ingresando en el migrate"
  	Rake::Task["db:operative"].invoke
    Rake::Task["db:systarget2015fruby"].invoke
  end

  task :systarget2015fruby do
  	puts "Migrando sobre la base de datos systarget2015fruby"
    ActiveRecord::Base.establish_connection $DB1_CONF
    ActiveRecord::Migrator.migrate("db/migrate/systarget2015fruby/")
  end

  task :operative do
  	puts "Migrando sobre la base de datos operativa"
    ActiveRecord::Base.establish_connection $DB2_CONF
    ActiveRecord::Migrator.migrate("db/migrate/operative/")
  end
end
