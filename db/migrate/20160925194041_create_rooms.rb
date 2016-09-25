class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :roomNumber
      t.string :size
      t.string :status
      t.string :building
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
