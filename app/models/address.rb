class Address < ApplicationRecord
  belongs_to :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  VALID_HIRAGANA_REGEX = /\A[\p{hiragana}\p{blank}ー－]+\z/
  VALID_ZENKAKU_REGEX = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/

  validates :postcode, presence: true
  validates :postcode, format: { with: /\A\d{7}\z/ }

  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :address, presence: true
  validates :sendname_first, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :sendname_last, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :sendname_first_kana, presence: true, format: { with: VALID_HIRAGANA_REGEX }
  validates :sendname_last_kana, presence: true, format: { with: VALID_HIRAGANA_REGEX }


  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone, format: { with: VALID_PHONE_REGEX }
end
