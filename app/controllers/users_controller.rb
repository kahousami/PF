class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :nickname)
  end
end
