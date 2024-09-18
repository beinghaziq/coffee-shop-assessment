class DiscountStrategy
  def apply(order, discount)
    raise NotImplementedError, "This method should be overridden in subclasses"
  end
end
