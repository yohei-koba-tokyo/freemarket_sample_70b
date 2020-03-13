class Address < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  validates :postcode, presence: true
  validates :prefecture, presence: true
  validates :municipality, presence: true
  validates :address, presence: true

end
