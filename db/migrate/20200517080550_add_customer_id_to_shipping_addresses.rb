class AddCustomerIdToShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_addresses, :customer_id, :integer, null: false, default: 0
    add_column :shipping_addresses, :postcode, :string, null: false, default: ""
    add_column :shipping_addresses, :address, :string, null: false, default: ""
    add_column :shipping_addresses, :name, :string, null: false, default: ""
  end
end
