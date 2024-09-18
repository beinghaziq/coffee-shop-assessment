class ComboDiscountStrategy < DiscountStrategy
  def apply(order, discount)
   amount = if combo_in_order?(order, discount.discountable)
      if discount.type == "percentage"
        (discount.discountable.items.where(id: discount.discountable_id).reduce(0)
          { |sum, item| sum + ((item.amount * item.quantity(order.id)) * (discount.amount / 100)) })
      else
        (discount.discountable.items.where(id: discount.discountable_id).reduce(0)
          { |sum, item| sum + (discount.amount * item.quantity(order.id)) })
      end
    end

    order.update(discounted_amount: order.discounted_amount - amount)
  end

  private

  def combo_in_order?(order, combo)
    combo.items_with_quantity.all? { |key, value| order.items_with_quantity[key] >= value }
  end
end
