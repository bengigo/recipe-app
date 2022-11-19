require 'rails_helper'

RSpec.describe 'Recipe food', type: :request do
  describe 'GET foods#index' do
    before(:each) do
      @user = User.create(name: 'mak', email: 'mak@test.com', password: '123456')
      post user_session_path, params: { user: { email: @user.email, password: @user.password } }
      get '/users/1/foods'
    end

    it 'Check status response' do
      expect(response.status).to be(200)
    end

    it 'Check rendered content' do
      expect(response.body).to include('Recipe')
    end
  end
end
