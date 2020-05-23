class AddNameToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :name, :string, null: false, default: "", unique: true
    add_column :genres, :is_vaild, :boolean, null: false, default: true
  end
  
end
