class RecipesController < ApplicationController
  # load_and_authorize_resource

  def index
    # @user = current_user
    # @recipes = current_user.recipes.includes(:user).order(created_at: :desc)
    @recipes = Recipe.all.includes([:user])
  end

  def show
    # should show the details (foods) of the recipe
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = params[:user_id]
    # @user = User.find(params[:user_id])
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
    if current_user == @recipe.user
    @recipe.destroy
    end
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
