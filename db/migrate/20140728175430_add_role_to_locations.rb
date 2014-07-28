class AddRoleToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :role, :string
  end
end
