class AddCustomerIdToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :customer_id, :integer, null: false, default: 0
    add_column :cart_items, :product_id, :integer, null: false, default: 0
    add_column :cart_items, :number, :integer, null: false, default: 0
  end
end
