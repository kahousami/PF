class HomeController < ApplicationController
  def top
  	@posts = Post.all.reverse_order
  end

  def about
  end
end
