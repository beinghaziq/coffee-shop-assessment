class Item < ApplicationRecord
	belongs_to :category
	has_one :discount, as: :discountable
end
