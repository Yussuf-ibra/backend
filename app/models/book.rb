class Book < ApplicationRecord
  has_many :reviews

  # Validations
  validates :title, :author, presence: true
end
