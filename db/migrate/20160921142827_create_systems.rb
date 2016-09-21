class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.string :name
      t.string :resource_group
      t.string :availability_set
      t.string :operating_system
      t.string :vm_size
      t.string :operating_system_version
      t.string :storage
      t.string :subnet
      t.string :ip
      t.string :nsg
      t.string :nsg_resource_group

      t.timestamps
    end
    add_index :systems, :name
    add_index :systems, :resource_group
    add_index :systems, :availability_set
    add_index :systems, :operating_system
    add_index :systems, :vm_size
    add_index :systems, :operating_system_version
    add_index :systems, :storage
    add_index :systems, :subnet
    add_index :systems, :ip
    add_index :systems, :nsg
    add_index :systems, :nsg_resource_group
  end
end
