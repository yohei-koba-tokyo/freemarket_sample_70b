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
  validates :birthday, presence: true

  validates :postcode, format: { with: /\A\d{7}\z/ }
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone, format: { with: VALID_PHONE_REGEX }
end