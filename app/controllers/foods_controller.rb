class FoodsController < ApplicationController
<<<<<<< HEAD
   def index
    @user=current_user
    @foods=@user.foods.includes(:user)
   end

   def new
    @food = Food.new
   end

   def show
    # should show the details (foods) of the recipe
    @food = Food.find(params[:id])
   
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

   def destroy
    @food=Food.find(params[:id])
    if current_user == @food.user
        @food.destroy
    end
    respond_to do |format|
        format.html do
            redirect_to user_foods_path(@food) , notice: 'Food deleted ✅'
        end
    end
   end


end
