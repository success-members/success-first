class AddLastNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string, null: false, default: ""
    add_column :customers, :first_name, :string, null: false, default: ""
    add_column :customers, :last_name_kana, :string, null: false, default: ""
    add_column :customers, :first_name_kana, :string, null: false, default: ""
    add_column :customers, :postcode, :string, null: false, default: ""
    add_column :customers, :address, :string, null: false, default: ""
    add_column :customers, :phone_number, :string, null: false, default: ""
    add_column :customers, :is_deleted, :boolean, null: false, default: true

    add_column :customers, :prefecture_code, :integer
    add_column :customers, :address_city, :string
    add_column :customers, :address_street, :string
    add_column :customers, :address_building, :string

  end
  
end
