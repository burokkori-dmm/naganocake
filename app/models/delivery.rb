class Delivery < ApplicationRecord
	belongs_to :user

	def full_name
		"〒#{postal_code} #{address} #{name}"
    end
end
