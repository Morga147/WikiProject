class WelcomeController < ApplicationController

  def index
    @posts = Post.all.order("created_at DESC")
  end #end index

  def about
  end

end
