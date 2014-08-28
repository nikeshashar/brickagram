class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
   @posts = Post.all
  end

  def new
   @post = Post.new
  end

  def create
   @post = Post.new(params[:post].permit(:title, :picture, :tags_list, :charges))
   @post.save
   redirect_to '/posts'
  end

  def destroy
    
  end

  def show
    @post = Post.find(params[:id])
  end
end
