class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :sub_last_name, presence: true
  validates :sub_first_name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, length: { maximum: 7 }
  validates :phone_number, presence: true, length: { maximum: 11 }

end
