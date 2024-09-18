class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
	belongs_to :customer, class_name: 'User'

	private

	def calculate_amount
		items.reduce(0) { |sum, item| sum + (item.amount * item.quantity(id)) }
	end

	def calculate_discount
		discounts.each do |discount|
      context = DiscountContext.new(select_discount_strategy(discount))
      context.apply_discount(self, discount)
    end
	end

	def discounts
	end

	def items_with_quantity
		items.map{|item| {item.id => item.quantity(id)}}
	end

  def select_discount_strategy(discount)
    case discount.discountable_type
    when 'Item'
      ItemDiscountStrategy.new
    when 'Category'
      CategoryAmountDiscountStrategy.new
    when 'Combo'
      ComboDiscountStrategy.new
    else
      raise "Unknown discount type: #{discount.discountable_type}"
    end
  end
end
