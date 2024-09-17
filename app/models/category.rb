class Category < ApplicationRecord
	has_many :items
    has_one :discount, as: :discountable
end