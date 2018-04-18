class CreateProgramsAndProgramsSuppliers < ActiveRecord::Migration
  def up
    create_table :programs do |t|
      t.string :name, :limit => 255, :null => false
      t.string :type, :limit => 255, :null => false
      t.integer :developer_id, :null => false
      t.datetime :developed_at
      t.string :serial_number, :limit => 5, :unique => true
      t.text :blurb  # descripción
      t.float :price
      t.timestamps
    end

    create_table :programs_suppliers do |t|
      t.integer :supplier_id, :null => false
      t.integer :program_id, :null => false
      t.timestamps
    end

    say_with_time 'Adding foreing keys' do
      # Add foreign key reference to authors_books table
      execute 'ALTER TABLE programs_suppliers ADD CONSTRAINT fk_programs_suppliers_suppliers
              FOREIGN KEY (supplier_id) REFERENCES suppliers(id) ON DELETE CASCADE'      
      execute 'ALTER TABLE programs_suppliers ADD CONSTRAINT fk_programs_suppliers_programs
              FOREIGN KEY (program_id) REFERENCES programs(id) ON DELETE CASCADE'
      # Add foreign key reference to publishers table
      execute 'ALTER TABLE programs ADD CONSTRAINT fk_programs_developers
              FOREIGN KEY (developer_id) REFERENCES developers(id) ON DELETE CASCADE'
    end
  end

  def self.down
    drop_table :programs
    drop_table :programs_suppliers
  end
end
