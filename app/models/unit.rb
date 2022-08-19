class Unit < ApplicationRecord
  has_many :ingredients
  validates :name, presence: true, length: { minimum: 3, maximum: 20}
  validates :shortcut_name, presence: true, length: { maximum: 5}
end