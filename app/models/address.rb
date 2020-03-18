class Address < ApplicationRecord
  belongs_to :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  validates :postcode, presence: true
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :address, presence: true

  validates :postcode, format: { with: /\A\d{7}\z/ }
  # validates :phone, presence: true
  # validates :phone, exclusion: { in: %w(-) }
  # validates :postcode, length: { maximum: 8 } 
  # validates :postcode, length: { minimum: 6 } 

  # validates :phone, length: { maximum: 100 }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone, presence: true, format: { with: VALID_PHONE_REGEX }
  # validates :phone, uniqueness: true, format: { with: /\A\d{10}$|^\d{11}\z/, message: "は10~11桁の数字を入力してください" }, allow_blank: true 
  # 10桁か11桁の数字の文字列
end