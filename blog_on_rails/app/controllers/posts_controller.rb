class PostsController < ApplicationController
  
    before_action :find_post, only: [:edit, :update, :show, :destroy]
    
    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def show
         @comments = @post.comments.order(created_at: :desc)
         @comment = Comment.new
    end

    def destroy
        @post.destroy
        redirect_to posts_path, alert: 'Post Deleted' 
    end

    def new
        @post = Post.new
    end

    def create
       
        @post = Post.new(post_params)
        
        if @post.save
            redirect_to post_path(@post.id), notice: 'Post Created' 
        else
            render :new
        end

    end

    def edit
        
    end

    def update
        if @post.update(post_params)
            redirect_to post_path(@post.id)
        else
            render :edit
        end 
    end

    private 

    def find_post
        @post = Post.find params[:id]
    end

    def post_params
        params.require(:post).permit(:title,:body)
    end

end