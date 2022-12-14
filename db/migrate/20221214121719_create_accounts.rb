class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :account_type, default: 0
      t.monetize :balance
      t.string :account_number

      t.timestamps
    end
  end
end
