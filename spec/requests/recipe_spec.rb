require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET recipes#index' do
    before(:each) do
      @user = User.create(name: 'mak', email: 'mak@test.com', password: '123456')
      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get '/recipes/index'
    end

    it 'Check status response' do
      expect(response.status).to be(200)
    end
  end
end
