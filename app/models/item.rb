class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 1000 }
  validates :image, presence: true
  validates :description, presence: true
  belongs_to :category
  has_many :item_orders
  has_many :orders, through: :item_orders
  enum status: %w(active retired)
end
