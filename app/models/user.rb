class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :cart_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :lastname, presence: true, length: { maximum: 7, minimum: 1 }
  validates :firstname, presence: true, length: { maximum: 7, minimum: 1 }
  validates :sublastname, presence: true, length: { maximum: 10, minimum: 1 }
  validates :subfirstname, presence: true, length: { maximum: 10, minimum: 1 }
  validates :address, presence: true, length: { maximum: 50, minimum: 20 }
  validates :postalcode, presence: true, length: { maximum: 7 }
  validates :phonenumber, presence: true, length: { maximum: 11 }
end
