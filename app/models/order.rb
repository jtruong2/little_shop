class Order < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :items

  def delivery_address
    "#{self.order_address} #{self.order_city}, #{self.order_state} #{self.order_zipcode}"
  end

  def order_date
    created_at.to_formatted_s(:long)
  end
end
