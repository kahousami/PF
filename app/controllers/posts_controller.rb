class PostsController < ApplicationController

    def new
    	@post = Post.new
    end

    def create
    	@post = Post.new(post_params)
    	@post.user_id = current_user.id
    	@post.save
    	redirect_to posts_path
    end

    def index
    	@posts = Post.all
    end

    def show
    end

    def edit
    end

    def destroy
    end

    private
    def post_params
    	params.require(:post).permit(:dive_point, :image, :caption)
    end

end
