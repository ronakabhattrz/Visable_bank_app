class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :account, foreign_key: true
      t.string :transaction_number

      t.timestamps
    end
  end
end
