class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.references :person
      t.references :location
      t.string :role
      t.timestamps
    end
  end
end
