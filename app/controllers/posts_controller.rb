class PostsController < ApplicationController
   def index
    @posts = Post.all
   end

   def new
    @post = Post.new
   end

   def create
    @formdata = Post.new(params[:post].permit(:title))
    @formdata.save
    redirect_to '/posts'
   end
end
