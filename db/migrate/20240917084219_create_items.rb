class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :quantity, null: false
      t.string :tax_percentage, null: false
      t.bigint :amount, null: false
      t.string :version, null: false
      t.belongs_to :category

      t.timestamps
    end
  end
end
