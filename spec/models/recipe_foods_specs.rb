require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
    @user = User.new(email: "user@mail.com", password: "password")
    @recipe = Recipe.create(name: 'Apples', preparation_time: '1 hour', cooking_time: '30 minutes',
                            description: 'Lorem ipsum', public: false, user_id: @user.id)
    @food = Food.create(name: 'Apples', measurement_unit: 'pieces', price: 18, quantity: 24, user_id: @user.id)
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      recipe = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: 2)
      expect(recipe).to be_valid
    end

    it 'is valid without a quantity' do
      recipe = RecipeFood.new(recipe_id: @recipe.id, food_id: @food.id, quantity: nil)
      expect(recipe).to_not be_valid
    end

    it 'is valid without a recipe_id' do
      recipe = RecipeFood.new(recipe_id: nil, food_id: @food.id, quantity: 2)
      expect(recipe).to_not be_valid
    end

    it 'is valid without a food_id' do
      recipe = RecipeFood.new(recipe_id: @recipe.id, food_id: nil, quantity: 2)
      expect(recipe).to_not be_valid
    end
  end

  context 'associations' do
    it 'belongs_to recipe' do
      t = RecipeFood.reflect_on_association(:recipe)
      expect(t.macro).to eq :belongs_to
    end

    it 'belongs_to food' do
      t = RecipeFood.reflect_on_association(:food)
      expect(t.macro).to eq :belongs_to
    end
  end
end