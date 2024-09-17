class Combo < ApplicationRecord
    has_one :discount, as: :discountable
end
