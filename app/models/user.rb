class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_many :foods
  has_many :recipes
=======

  has_many :foods , foreign_key: 'user_id'
>>>>>>> 2eb991989bf12eefa0ce376793b7cf9ad187aa12
end
