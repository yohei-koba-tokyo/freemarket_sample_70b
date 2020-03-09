class Category < ApplicationRecord
  has_many :items ,dependent: :destroy
  has_ancestry
end
