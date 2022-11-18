class Food < ApplicationRecord


  belongs_to :user , foreign_key: 'user_id' , class_name: 'User'
  has_many :recipe_foods , dependent: :delete_all
  has_many :recipes, through: :recipe_foods
  validates :name, :price, :quantity, :measurement_unit, presence: true
end

