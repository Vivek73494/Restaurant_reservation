class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :table, null: false, foreign_key: true
      t.date :date, null: false
      t.string :time_slot, null: false

      t.timestamps
    end
    add_index :reservations, [:table_id, :date, :time_slot], unique: true
  end
end
