class OederDetail < ApplicationRecord
	belongs_to :order
	belongs_to :sweet
end
