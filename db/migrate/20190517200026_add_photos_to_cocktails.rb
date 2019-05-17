class AddPhotosToCocktails < ActiveRecord::Migration[5.2]
  def change
  	add_column :cocktails, :photos, :string
  end
end
