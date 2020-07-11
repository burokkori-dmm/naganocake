class Admin < ApplicationRecord
  #管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクトさせる、
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users

end
