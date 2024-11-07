class BookClub < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_many :users, through: :memberships
  has_many :discussions
  has_many :events

  # Validations
  validates :name, presence: true
end
