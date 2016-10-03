class Renamecolumn2 < ActiveRecord::Migration[5.0]
  def change
    rename_column :searches, :roomNumber, :roomnumber
  end
end
