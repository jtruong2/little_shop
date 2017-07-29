class User < ApplicationRecord
  has_secure_password
  enum role: %w(guest, default, admin)
  has_many :orders
end
