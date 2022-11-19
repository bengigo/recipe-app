class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_food = RecipeFood.new
  end

  def destroy
    @recipe_food.destroy
    redirect_to user_recipe_path(current_user, @recipe_food.recipe)
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(recipe_food_params)
    if @recipe_food.save
      redirect_to user_recipe_path(current_user, @recipe)
    else
      render :new
    end

  end

  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end


  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
