class CreateAdminpages < ActiveRecord::Migration[5.0]
  def change
    create_table :adminpages do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
