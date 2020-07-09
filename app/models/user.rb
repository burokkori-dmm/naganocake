class User < ApplicationRecord
  #passwordとpassword_confirmationに入力した２つのパスワードが一致している場合に、userモデルのpassword_digestカラムに暗号化されたpasswordが保存される
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true 
             #uniquness: true#重複禁止
             #format: {  # 正規表現の設定で、withに指定したパターンにマッチしたもののみ許可している。
                #with: /\A[a-z0-9]+\z/,
                # \A 文頭、[a-z0-9] 小文字英数字のみ許可、\z 行末
                #message: 'は小文字英数字で入力してください。' エラーメッセージを指定
              #}
  validates :first_name, presence: true
  validates :sub_last_name, presence: true
  validates :sub_first_name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true, length: { maximum: 7 }
  validates :phone_number, presence: true, length: { maximum: 11 }
  def active_for_authentication?#論理削除
    super && (self.flag == false)
  end
end
