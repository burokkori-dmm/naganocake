class Sweet < ApplicationRecord
	attachment :image
	belongs_to :genre
	has_many :oreder_details, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	enum sale_status: { 販売中: 0, 販売停止中: 1 }
	validates :name, presence: true
	validates :tax_free_price, presence: true
	validates :detail, presence: true
	validates :sale_status, presence: true
end
