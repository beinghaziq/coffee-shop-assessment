class DiscountContext
  attr_reader :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def apply_discount(order, discount)
    strategy.apply(order, discount)
  end
end
