class CreateTables < ActiveRecord::Migration[8.1]
  def change
    create_table :tables do |t|
      t.integer :table_number
      t.integer :capacity

      t.timestamps
    end
  end
end
