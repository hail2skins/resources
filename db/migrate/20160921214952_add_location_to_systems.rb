class AddLocationToSystems < ActiveRecord::Migration[5.0]
  def change
    add_column :systems, :location, :string
    add_index :systems, :location
  end
end
