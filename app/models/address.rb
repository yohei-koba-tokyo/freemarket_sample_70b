class Address < ApplicationRecord
  belongs_to :user

  validates :kind, inclusion: {in: %w(- ' ')}
  # validates :phone, format: {with: /\A[0-9]{3}-[0-9]{4}-[0-9]{4}\z/}
end
