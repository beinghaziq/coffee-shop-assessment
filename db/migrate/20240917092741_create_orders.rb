class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.bigint :amount
      t.integer :customer_id
      t.string :status
      t.bigint :discounted_amount

      t.timestamps
    end
  end
end
