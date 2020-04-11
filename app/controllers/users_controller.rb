class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :profile_image)
  end
end
