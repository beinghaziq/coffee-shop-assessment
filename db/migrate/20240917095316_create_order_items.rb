class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :item
      t.belongs_to :combo
      t.integer :quantity

      t.timestamps
    end
  end
end
