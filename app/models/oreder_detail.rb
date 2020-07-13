class OrederDetail < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :sweet

	scope :created_today, -> { where(created_at: Time.zone.now.all_day).select(:product_id).distinct }

	enum making_status: { 着手不可: 0, 制作待ち: 1, 制作中: 2, 制作完了: 3}
	validates :making_status, presence: true
end
