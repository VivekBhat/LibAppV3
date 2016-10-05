class Renamecolumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :rooms, :roomNumber, :roomnumber
  end
end
