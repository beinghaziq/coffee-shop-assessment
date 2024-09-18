class CreateDiscounts < ActiveRecord::Migration[7.1]
  def change
    create_table :discounts do |t|
      t.references :discountable, polymorphic: true, null: false
      t.bigint :amount
      t.string :discount_type

      t.timestamps
    end
  end
end
