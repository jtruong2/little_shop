class Order < ApplicationRecord
  #validates :status, presence: true
  #validates :subtotal, presence: true  #validates :total, presence: true
  #validates :order_address, presence: true
  #validates :order_city, presence: true
  #validates :order_state, presence: true
  #validates :order_zipcode, presence: true
  #validates :order_phone, presence: true
  belongs_to :user
  has_many :item_orders
  has_many :items, through: :item_orders
  after_save :fill_order_info

  enum status: %w(ordered paid cancelled completed)

  def delivery_address
    "#{self.order_address} #{self.order_city}, #{self.order_state} #{self.order_zipcode}"
  end

  def order_date
    created_at.to_formatted_s(:long)
  end

  def order_closed
    updated_at.to_formatted_s(:long)
  end

  private

  def fill_order_info

  end
end
