class IngredientName < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 15}
end