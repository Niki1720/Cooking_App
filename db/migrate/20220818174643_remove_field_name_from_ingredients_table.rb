class RemoveFieldNameFromIngredientsTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :unit
  end
end
