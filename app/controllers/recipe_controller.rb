class RecipeController < ApplicationController
  def index
    # what should index do?
    # should list public recipes
    @user = current_user
    @recipes = @user.recipes.includes(:user).order(created_at: :desc)
  end

  def show
    # what should show do?
    # should show the details (foods) of the recipe
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    # what should new do?
    @recipe = Recipe.new
  end

  def create
    # what should create do?
    @recipe = Recipe.new(recipe_params)
    @user = User.find(params[:user_id])
    respond_to do |format|
      format.html do
        if @post.save
          redirect_to user_recipes_path(user_id: @recipe.user.id). notice: 'Recipe added ✅'
        else
          notice: 'Recipe is not created ❌'
        end
      end
    end
  end

  def public
    @public_recipes = Recipe.includes([:user], [:recipe_foods]).where(public:true).order(created_at: :desc)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(user_id: @recipe.user.id). notice: 'Recipe deleted ✅'
      end
    end
  end

  privete

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
