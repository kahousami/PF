class PostsController < ApplicationController

    before_action :login_check, only: [:new, :index, :edit, :update, :destroy]

    def new
    	@post = Post.new
    end

    def create
    	@post = Post.new(post_params)
        logger.debug @post.errors.inspect
    	@post.user_id = current_user.id
    	if @post.save
    	   redirect_to post_path(@post)
        else
            render :new
        end
    end

    def index
    	@posts = Post.all
        @posts = Post.page(params[:page]).per(10).reverse_order
    end

    def show
        @post = Post.find(params[:id])
        @post_comment = PostComment.new
    end

    def edit
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private
    def post_params
    	params.require(:post).permit(:dive_point, :image, :caption, :user_id)
    end

    def login_check
        unless user_signed_in?
            flash[:alert] = "ログインしてください"
            redirect_to root_path
        end
    end

end
