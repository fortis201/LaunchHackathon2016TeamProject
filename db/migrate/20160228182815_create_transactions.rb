class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :vendor, index: true, foreign_key: true
      t.decimal :amount
      t.string :currency
      t.decimal :bitcoin_bought

      t.timestamps null: false
    end
  end
end
