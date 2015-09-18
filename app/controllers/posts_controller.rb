class PostsController < ApplicationController
  before_action :find_post, only: [:show]

  def index
  end #end index

  def show
  end #end show

  def new
    @post = Post.new
  end #end new

  def create
    @post = Post.new(post_params)
    if @post.save
      #This redirects to the showpage of the newly created post
      redirect_to @post
    else
      render 'new'
    end #end if/else
  end #end create

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end #end post_params

  def find_post
    @post = Post.find(params[:id])
  end #end find_article
end
