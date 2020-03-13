class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :credit
  has_one :profile, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :solditems, dependent: :destroy


  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  VALID_LAST_NAME_KANA_REGEX = /^[ぁ-ん]+$/
  VALID_FIRST_NAME_KANA_REGEX = /^[ぁ-ん]+$/

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: VALID_LAST_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_FIRST_NAME_KANA_REGEX }
  validates :birthday, presence: true



end


# 全角のバリデーション
# エラーの表示箇所　させ方