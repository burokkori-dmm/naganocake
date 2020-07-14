class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :sweet
	#attachment :image

	validates :peace, presence: true
end
