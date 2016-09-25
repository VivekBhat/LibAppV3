class CreateBookingHistroysRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_histroys_rooms do |t|
      t.references :booking_histroy
      t.references :room
    end
    add_index :booking_histroys_rooms, [:booking_histroy_id, :room_id], :unique => true
  end
end
