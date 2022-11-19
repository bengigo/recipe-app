class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id' ,class_name: 'User'
  # delegate :name, to: :user , prefix: :user_name
  has_many :recipe_foods
end
