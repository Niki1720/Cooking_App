class RenameIngredientNameToIngredientNames < ActiveRecord::Migration[6.1]
  def change
    rename_table :ingredient_name, :ingredient_names
  end
end
