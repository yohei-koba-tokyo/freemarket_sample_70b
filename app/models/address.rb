class Address < ApplicationRecord
  belongs_to :user

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  validates :postcode, presence: true
  validates :postcode, format: { with: /\A\d{7}\z/ }

  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :address, presence: true

  
  # validates :phone, length: {minimum: 11, maximum:11},presence: true
end
