class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
  belongs_to :unit
  validates :name, presence: true, length: { minimum: 3, maximum: 15}
  validates :unit, presence: true, length: {minimum: 3, maximum: 10}
  validates :amount, presence: true, numericality: {greater_than: 0}
end