class AddCustomerIdToOrder < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :customer_id, :integer, null: false, default: 0
  end
end
