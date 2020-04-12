class HomeController < ApplicationController
  def top
  	@posts = Post.all.reverse_order
  	@posts = Post.page(params[:page]).per(18)
  end

  def about
  end
end
