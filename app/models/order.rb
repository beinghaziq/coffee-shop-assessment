class Order < ApplicationRecord
  has_many :order_items
  has_many :items, through: :order_items
	has_many :order_combos
  has_many :combos, through: :order_combos
	belongs_to :customer, class_name: 'User'
	
	after_create_commit :calculate_amount
	after_create_commit :calculate_discount

	accepts_nested_attributes_for :order_items, allow_destroy: true

	# TODO: Move query to query object
	def discounts
		Discount.where('(discountable_type = ? AND discountable_id IN (?)) OR (discountable_type = ?
                AND discountable_id IN (?)) OR (discountable_type = ? AND discountable_id IN (?))', 
                'Item', items.ids, 
                'Combo', combos.ids, 
                'Category', items.pluck(:category_id).compact)

	end

	private

	def calculate_amount
		amount = items.reduce(0) { |sum, item| sum + (item.amount * item.quantity(id)) }
		self.update(amount: amount, discounted_amount: amount)
	end

	def calculate_discount
		discounts.each do |discount|
      context = DiscountContext.new(select_discount_strategy(discount))
      context.apply_discount(self, discount)
    end
	end

	def items_with_quantity
		items.map{|item| { item.id => item.quantity(id) }}
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
