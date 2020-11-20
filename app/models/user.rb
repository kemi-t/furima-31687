class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  # ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
  validates :first_name
  validates :last_name
  end
  # ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角文字を使用してください' } do
  validates :first_name_kana
  validates :last_name_kana
  end
  validates :birthday,        presence: true
end
