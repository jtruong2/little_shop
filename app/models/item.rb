class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :description, presence: true
  belongs_to :category
  has_many :items_orders
  has_many :orders, through: :items_orders
end
