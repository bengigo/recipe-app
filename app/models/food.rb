class Food < ApplicationRecord
    belongs_to :user , foreign_key: 'user_id' , class_name: 'User'

    validates :name, :price, :quantity, :measurement_unit, presence: true
end
