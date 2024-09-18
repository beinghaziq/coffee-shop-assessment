class Item < ApplicationRecord
	belongs_to :category
	has_one :discount, as: :discountable
	has_many :order_items
  	has_many :orders, through: :order_items

	def quantity_in_order(order_id)
		order_items.where(order_id: order_id).sum(:quantity)
	end

	def quantity_in_combo(combo_id)
		combo_items.where(combo_id: combo_id).sum(:quantity)
	end
end
