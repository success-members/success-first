class AddNameToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :payment_method, :integer, null: false, default: 0
  	add_column :orders, :postage, :integer, null: false, default: 800
  	add_column :orders, :billing, :integer, null: false, default: 0
  	add_column :orders, :order_status, :integer, null: false, default: 0
  	add_column :orders, :postcode, :string, null: false, default: ""
  	add_column :orders, :address, :string, null: false, default: ""
    add_column :orders, :name, :string, null: false, default: ""

  end
end
