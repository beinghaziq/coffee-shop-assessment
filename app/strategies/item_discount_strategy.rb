class ItemDiscountStrategy < DiscountStrategy
  def apply(order, discount)
    if discount.type == "percentage"
      order.discounted_amount -= (order.items.where(id: discount.discountable_id).reduce(0) { |sum, item| sum + ((item.amount * item.quantity(order.id)) * (discount.amount / 100)) })
    else
      order.discounted_amount -= (order.items.where(id: discount.discountable_id).reduce(0) { |sum, item| sum + (discount.amount * item.quantity(order.id)) })
    end
  end
end
