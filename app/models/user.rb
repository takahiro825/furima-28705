class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  validates :nickname, :email, :password, :password_confirmation, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday,  presence: true

  validates :password, format: {with:/[a-z\d]{6,}/i}
  #パスワードは６文字以上
  
  validates :password, format: {with:/\A[a-z0-9]+\z/i}
  #パスワードは半角英数字混同
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :family_name
    validates :first_name
  end
   #ユーザー本名が全角の（漢字・かな・カナ）で入力

  with_options presence: true, format: { with: /\A[ァ-ン一]+\z/ } do
    validates :family_name_kana
    validates :first_name_kana
  end
  #ユーザー本名が全角のカナで入力

  validates :email,uniqueness: true
  #メールアドレスの一意性

  #deviseのデフォルトで＠のバリデーションの記述は不要

end
