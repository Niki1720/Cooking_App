class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes, :join_table => :ingredients_recipes

  belongs_to :unit

  validates :name, presence: true, length: { minimum: 3, maximum: 15}
  validates :amount, presence: true, numericality: {greater_than: 0}


end