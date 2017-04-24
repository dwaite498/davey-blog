class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :delete]
    
    def index
       @posts = Post.all 
    end
    
    def new
       @post = Post.new 
    end
    
    def create
       @post = Post.new
       if @post.save(post_params)
           flash[:notice] = "Post saved successfully"
           redirectd_to post_path
       else
          flash[:alert] = "Error creating post!"
          render :new
       end
    end
    
    def edit
        find_post
    end
    
    def show
        find_post
    end
    
    def destroy
        find_post
       if post.destroy
           flash[:notice] = "Post successfully deleted."
           redirectd_to posts_path
       else
          flash[:alert] = "Error deleting post!" 
       end
    end
    
    private
    
    def find_post
       @post = Post.find(params[:id]) 
    end
end
