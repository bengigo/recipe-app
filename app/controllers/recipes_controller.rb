class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes([:user])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = params[:user_id]
    respond_to do |format|
      format.html do
        if @recipe.save
          redirect_to user_recipes_path(@recipe), notice: 'Recipe added ✅'
        else
          render :new, notice: 'Recipe is not created ❌'
        end
      end
    end
  end

  def public
    @public_recipes =Recipe.where(public: true).order(created_at: :desc)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(@recipe), notice: 'Recipe deleted ✅'
      end
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
