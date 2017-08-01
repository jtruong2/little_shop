class DropTableItemsOrders < ActiveRecord::Migration[5.1]
  def change
    drop_table :items_orders
  end
end
