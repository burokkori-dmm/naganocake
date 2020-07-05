class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :cart_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
