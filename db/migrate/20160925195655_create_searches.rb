class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :roomNumber
      t.string :size
      t.string :status
      t.string :building

      t.timestamps
    end
  end
end
