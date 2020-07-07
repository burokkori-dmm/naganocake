class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :sweet
	attachment :image
end
