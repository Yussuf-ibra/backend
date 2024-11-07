class Event < ApplicationRecord
  belongs_to :book_club

  # Validations
  validates :title, :start_time, presence: true
end
