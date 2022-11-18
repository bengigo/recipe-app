require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /index' do
    before do
      @user = User.create(email: 'user@mail.com', password: "123456")
      @recipe = @user.recipes.create(name: 'Recipe 1', preparation_time: 20, cooking_time: 30, description: 'Recipe 1 description', public: true)
    end
    it 'returns http success' do
      get(user_recipes_path(@user))
      expect(response).to have_http_status(:ok)
    end
    it 'loads all of the recipes' do
      get(user_recipes_path(@user))
      expect(response.body).to include(@recipe.name)
    end
  end
end
