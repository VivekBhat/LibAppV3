class FixNameColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :adminpages, :password, :password_digest
  end
end
