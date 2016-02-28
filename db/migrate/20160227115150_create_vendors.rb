class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :businessName
      t.integer :walletID
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
