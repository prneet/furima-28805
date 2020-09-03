class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: '英数字６文字以上を使用してください。' }
  
  with_options presence: true do
    validates :name
    validates :birthday
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用して下さい' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用して下さい' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
