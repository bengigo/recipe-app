class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id' ,class_name: 'User'
  has_many :recipe_foods
end
