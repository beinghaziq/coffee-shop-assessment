class Combo < ApplicationRecord
    has_one :discount, as: :discountable
    has_many :combo_items
    has_many :items, through: :combo_items
    has_many :order_combos
    has_many :orders, through: :order_combos

    accepts_nested_attributes_for :discount, allow_destroy: true
    accepts_nested_attributes_for :combo_items, allow_destroy: true

    def items_with_quantity
		  items.map{ |item| {item.id => item.quantity_in_combo(id)} }
	  end
end
