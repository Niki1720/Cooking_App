class Recipe < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 10, maximum: 50}
  validates :description, presence: true, length: { minimum: 20, maximum: 150}
end