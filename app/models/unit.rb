class Unit < ApplicationRecord
  has_many :ingredients
  validates :name, presence: true, length: { minimum: 3, maximum: 15}, uniqueness: { case_sensitive: false }
  validates :shortcut_name, presence: true, length: { maximum: 5 }, uniqueness: { case_sensitive: false }
end