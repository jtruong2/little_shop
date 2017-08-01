class AddDefaultToImage < ActiveRecord::Migration[5.1]
  def change
    change_column :items, :image, :string, default: 'pizza_planet_logo.jpg'
  end
end
