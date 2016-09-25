class CreateReservationHistroys < ActiveRecord::Migration[5.0]
  def change
    create_table :reservation_histroys do |t|
      t.time :from
      t.time :to
      t.date :date
      t.integer :rooms_id
      t.integer :users_id

      t.timestamps
    end
  end
end
