class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true
  belongs_to :category
  has_many :item_orders
  has_many :orders, through: :item_orders
  enum status: %w(active retired)


  def self.search(search)
    where(" title ILIKE ? OR description ILIKE ?", "#{search}", "#{search}")
  end
end
