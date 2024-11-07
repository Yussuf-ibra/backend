class Discussion < ApplicationRecord
  belongs_to :user
  belongs_to :book_club

  # Validations
  validates :content, presence: true
end
