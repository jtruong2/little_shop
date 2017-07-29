class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :subtotal
      t.integer :total
      t.string :order_address
      t.string :order_city
      t.string :order_state
      t.string :order_zipcode
      t.string :order_phone

      t.timestamps
    end
  end
end
