class UsersController < ApplicationController
  def index
    @users = User.all
    # @user = current_user
  end

  def show
    @user = User.find(params[id])
  end

  def admin?
    role == 'admin'
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end


# class UsersController < ApplicationController
#   load_and_authorize_resource
#   before_action :set_user, only: %i[show edit update destroy]
#   def create; end
#   def show; end

#   def set_user
#     @user = User.find(params[:id])
#   end
# end
