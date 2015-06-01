require 'rails/generators/active_record'

class Persistable::MigrationGenerator < ::Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)
  argument :table, :type => :string, :default => "application"
  desc 'Generate migration file required for persistable'

  def install
    path = File.join('app', 'models', "#{table.singularize}.rb")
    insert_into_file(path, after: "ActiveRecord::Base\n") do
      <<-Ruby
  include Persistable
      Ruby
    end
    migration_template 'migration.rb', "db/migrate/add_persistable_to_#{table}.rb"
  end

  def migration_data
    <<-RUBY
    add_column :#{table}, :deleted, :boolean
    RUBY
  end

  def table_name
    table
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end