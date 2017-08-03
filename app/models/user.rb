class User < ApplicationRecord
  #validates :email, presence: true, uniqueness: true
  #validates :password, presence: true
  #validates :role, presence: true
  #validates :address, presence: true
  #validates :city, presence: true
  #validates :state, presence: true
  #validates :zipcode, presence: true
  #validates :phone, presence: true
  has_secure_password
  enum role: %w(default admin)
  has_many :orders
  has_many :reviews
end
