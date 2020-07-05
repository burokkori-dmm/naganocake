class CartItem < ApplicationRecord
	belongs_to :user
	belongs_to :sweet
end

#商品ごとの合計金額
def total_price
	sweet.price * peace
end
#カート全体の商品数
def total_number
	sweet.to_a.sum { |sweet| sweet.peace}
	#sweetなのか？