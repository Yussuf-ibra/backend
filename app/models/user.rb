class User < ApplicationRecord
  has_secure_password

  # Relationships
  has_many :memberships
  has_many :book_clubs, through: :memberships
  has_many :discussions
  has_many :reviews
  has_many :notifications
  has_many :events, through: :book_clubs

  # Role management (regular user or admin)
  enum role: { regular: 'regular', admin: 'admin' }

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?

  
end
