class AddUnitIdToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :unit_id, :int
  end
end
