class Recipe < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :ingredients, join_table: :ingredients_recipes, class_name: "Ingredient"

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { minimum: 5, maximum: 50}
  validates :description, presence: true, length: { minimum: 20, maximum: 150}
end