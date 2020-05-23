class RenameGenresColumnToGenres < ActiveRecord::Migration[5.2]
  def change
  	rename_column :genres, :is_vaild, :is_valid
  end
end
