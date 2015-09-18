class PostsController < ApplicationController
  def index
  end #end index

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
    params.requre(:post).permit(:title, :content)
  end #end post_params
end
