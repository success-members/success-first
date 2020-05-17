class AddOrderIdToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :order_id, :integer, null: false, default: 0
    add_column :order_products, :product_id, :integer, null: false, default: 0
    add_column :order_products, :unit_price, :integer, null: false, default: 0
    add_column :order_products, :number, :integer, null: false, default: 0
    add_column :order_products, :making_status, :integer, null: false, default: 0
  end
end
