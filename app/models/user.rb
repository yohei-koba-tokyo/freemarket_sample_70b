class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :credit
  has_one :address, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :solditems, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_HIRAGANA_REGEX = /\A[\p{hiragana}\p{blank}ー－]+\z/
  VALID_ZENKAKU_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i


  validates :nickname, presence: true, length: { maximum: 6 }
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
  validates :last_name, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :first_name, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_HIRAGANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_HIRAGANA_REGEX }

  validates :birthday, presence: true
  accepts_nested_attributes_for :address


end
