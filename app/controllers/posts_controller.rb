class PostsController < ApplicationController
    before_action :authenticate_admin!, except: [:index, :show]
before_action :find_post, only: [:edit, :update, :show, :destroy]
    
    def index
       @posts = Post.all 
    end
    
    def new
       @post = Post.new 
    end
    
    def create
       @post = Post.new
        @post.title = params[:post][:title]
        @post.body = params[:post][:body]
       if @post.save(post_params)
           flash[:notice] = "Post saved successfully"
           redirect_to post_path(@post)
       else
          flash[:alert] = "Error creating post!"
          render :new
       end
    end
    
    def edit
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def destroy
       if post.destroy
           flash[:notice] = "Post successfully deleted."
           redirect_to posts_path
       else
          flash[:alert] = "Error deleting post!" 
       end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
    def find_post
       @post = Post.find(params[:id]) 
    end
end
