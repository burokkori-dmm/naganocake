module ApplicationHelper
	def addTax(price)
		tax_in_price = (price * 1.1).round
	end
end
