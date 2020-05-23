class AddGenreIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :genre_id, :integer, null: false, default: 0
    add_column :products, :name, :string, null: false, default: ""
    add_column :products, :image, :string, null: false, default: ""
    add_column :products, :price, :integer, null: false, default: 0
    add_column :products, :explanation, :text, null: false, default: ""
    add_column :products, :is_sale, :boolean, null: false, default: true
    
  end
end
