class HomeController < ApplicationController
  def top
  	@posts = Post.all
  	@posts = Post.page(params[:page]).per(15).reverse_order
  end

  def about
  end
end
