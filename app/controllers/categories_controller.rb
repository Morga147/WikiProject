class CategoriesController < ApplicationController
  before_action :find_category, only: [:show]

  def index
  end #end index

  def show
    @posts = Post.where(category_id: @category).order("created_at DESC")
  end #end show

  private
  def find_category
    @category = Category.find(params[:id])
  end #end find_category
end
