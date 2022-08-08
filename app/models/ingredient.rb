class Ingredient < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 15}
  validates :unit, presence: true, length: {minimum: 3, maximum: 10}
  validates :amount, presence: true, numericality: {greater_than: 0}
end