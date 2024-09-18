class ItemDiscountStrategy < DiscountStrategy
  def apply(order, discount)
    amount = if discount.type == "percentage"
      (order.items.where(id: discount.discountable_id).reduce(0)
        { |sum, item| sum + ((item.amount * item.quantity(order.id)) * (discount.amount / 100)) })
    else
      (order.items.where(id: discount.discountable_id).reduce(0)
        { |sum, item| sum + (discount.amount * item.quantity(order.id)) })
    end

    order.update(discounted_amount: order.discounted_amount - amount)
  end
end
