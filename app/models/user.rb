class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :joins, dependent: :destroy
  validates :first_name, :last_name, :city, :state, presence: true
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
