class ComboDiscountStrategy < DiscountStrategy
  def apply(order, discount)
    if combo_in_order?(order, discount.discountable)
      if discount.type == "percentage"
        order.discounted_amount -= (discount.discountable.items.where(id: discount.discountable_id).reduce(0) { |sum, item| sum + ((item.amount * item.quantity(order.id)) * (discount.amount / 100)) })
      else
        order.discounted_amount -= (discount.discountable.items.where(id: discount.discountable_id).reduce(0) { |sum, item| sum + (discount.amount * item.quantity(order.id)) })
      end
    end
  end

  private

  def combo_in_order?(order, combo)
    combo.items_with_quantity.all? { |key, value| order.items_with_quantity[key] >= value }
  end
end
