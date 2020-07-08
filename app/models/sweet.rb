class Sweet < ApplicationRecord
	attachment :image
	belongs_to :genre
	has_many :order_details
	has_many :cart_items
	enum sale_status: { 販売中: 0, 販売停止中: 1 }
end
