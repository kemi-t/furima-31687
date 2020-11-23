class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  with_options presence: true do
    validates :nickname
    validates :birthday
      # ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '漢字、ひらがな、カタカナのいずれかを使用してください' } do
        validates :first_name
        validates :last_name
      end
      # ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
      with_options format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' } do
        validates :first_name_kana
        validates :last_name_kana
      end
    end
end
