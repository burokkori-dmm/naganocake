class Delivery < ApplicationRecord
	belongs_to :user

	def full_name
	    "〒#{postal_code} #{address} #{name}"
    end

    validates :name, presence: true
    validates :address, presence: true
    validates :postal_code, presence: true

end
