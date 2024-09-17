class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.bigint :amount
      t.integer :customer_id
      t.string :status

      t.timestamps
    end
  end
end
