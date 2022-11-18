class Food < ApplicationRecord
<<<<<<< HEAD


  belongs_to :user , foreign_key: 'user_id' , class_name: 'User'
  has_many :recipe_foods , dependent: :delete_all
=======
  belongs_to :user , foreign_key: 'user_id' , class_name: 'User'
  has_many :recipe_foods
>>>>>>> b49eb41c9b7c4f6e6a3f7fc46de993c868a47af8
  has_many :recipes, through: :recipe_foods
  validates :name, :price, :quantity, :measurement_unit, presence: true
end