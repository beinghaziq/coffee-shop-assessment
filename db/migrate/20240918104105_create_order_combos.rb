class CreateOrderCombos < ActiveRecord::Migration[7.1]
  def change
    create_table :order_combos do |t|
      t.belongs_to :order
      t.belongs_to :combo
      t.integer :quantity

      t.timestamps
    end
  end
end
