class Recipe < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :ingredients
  validates :name, presence: true, length: { minimum: 10, maximum: 50}
  validates :description, presence: true, length: { minimum: 20, maximum: 150}
end