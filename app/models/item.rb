class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :description, presence: true
  belongs_to :category
  has_many :item_orders
  has_many :orders, through: :item_orders
  enum status: %w(active retired)
end
