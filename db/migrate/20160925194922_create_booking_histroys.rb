class CreateBookingHistroys < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_histroys do |t|
      t.time :from
      t.time :to
      t.date :date
      t.references :rooms

      t.timestamps
    end
  end
end
