class AddSalePricetoItemsOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :items_orders, :sale_price, :decimal
  end
end
