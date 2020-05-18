class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.integer :genre_id
    	t.string :name
    	t.string :image
    	t.integer :price
    	t.text :explanation
    	t.boolean :is_sale, default: true, null: false

      t.timestamps
    end
  end
end
