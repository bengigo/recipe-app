class FoodsController < ApplicationController
   def index
    @user=current_user
    @foods=@user.foods.includes(:user)
   end

   def create
    
   end
end
