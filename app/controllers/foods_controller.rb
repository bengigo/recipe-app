class FoodsController < ApplicationController
  def index
   @user=current_user
   @foods=@user.foods.includes(:user)
  end

  def new
   @food = Food.new
  end

  def create
   @food=Food.new(food_params)
   @food.user_id = params[:user_id]
   respond_to do |format|
       format.html do
           if @food.save
           redirect_to user_foods_path(current_user.id) , notice: 'Food Add Successfuly'
           else
           render :new  , notice: 'Food can`t Add!'
           end
          end
       end
   end
  def food_params
       params.require(:food).permit(:name , :measurement_unit , :price ,:quantity)
  end
end