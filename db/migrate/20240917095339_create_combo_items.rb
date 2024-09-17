class CreateComboItems < ActiveRecord::Migration[7.1]
  def change
    create_table :combo_items do |t|
      t.integer :quantity
      t.belongs_to :item
      t.belongs_to :combo

      t.timestamps
    end
  end
end
