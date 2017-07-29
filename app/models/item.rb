class Item < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :description, presence: true
  belongs_to :category
  has_and_belongs_to_many :orders
end
