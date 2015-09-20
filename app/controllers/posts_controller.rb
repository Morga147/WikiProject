class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize, except: [:show, :index]

  def authorize
    if current_user.nil?
      redirect_to login_path, alert: "Not authorized. Only #{@post.user} has access."
    else
      if @post && @post.user != current_user
        redirect_to root_path, alert: "Not authorized. Only #{@post.user} has access."
      end #end second if/else
    end #end first if/else
  end #end def authorize

  def index
    @posts = Post.all.order("created_at DESC")
  end #end index

  def show
  end #end show

  def new
    @post = Post.new
  end #end new

  def create
    @post = current_user.build.new(post_params)
    if @post.save
      #This redirects to the showpage of the newly created post
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render 'new'
    end #end if/else
  end #end create

  def edit
  end #end edit

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render 'edit'
    end #end if/else
  end #end update

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post was successfully destroyed.'
  end #end destroy

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end #end post_params

  def find_post
    @post = Post.find(params[:id])
  end #end find_article
end
