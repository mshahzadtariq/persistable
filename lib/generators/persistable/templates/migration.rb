class AddPersistableTo<%= table_name -%> < ActiveRecord::Migration
  def change
    <%= migration_data -%>
  end
end