require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @recipe = Recipe.new(name: "Recipe 1", preparation_time: 10, cooking_time: 20, description: "This is a recipe", public: true)
  end
  it "has a name" do    
    expect(@recipe.name).to eq("Recipe 1")
  end
  it "is prepared in 10 minutes" do
    expect(@recipe.preparation_time).to eq("10")
  end
  it "is cooked in 20 minutes" do
    expect(@recipe.cooking_time).to eq("20")
  end
  it "has a description" do
    expect(@recipe.description).to eq("This is a recipe")
  end
end
