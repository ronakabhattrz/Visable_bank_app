class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.references :from_account, foreign_key: { to_table: 'accounts' },index: true
      t.references :to_account, foreign_key: { to_table: 'accounts' },index: true
      t.string :transaction_number

      t.timestamps
    end
  end
end
