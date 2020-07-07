class Genre < ApplicationRecord
	has_many :sweets
	enum genre_status: { 無効: false, 有効: true }
end
