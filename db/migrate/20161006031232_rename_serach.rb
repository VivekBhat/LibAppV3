class RenameSerach < ActiveRecord::Migration[5.0]
  def change
    rename_column :searches, :roomNumber, :roomnumber
  end
end
