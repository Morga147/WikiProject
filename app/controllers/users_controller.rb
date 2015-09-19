class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end #end index

  def login
  end #end login

  def login_post
    @user = User.find_by({email: params[:email]})
    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to '/login'
      end #end if/else
    else
      redirect_to '/login'
    end #end if/else
  end #end login_post


  def show
    @users = User.all.order("created_at DESC")
  end #end show

  # Sign-Up / Create a new user profile
  def new
    @user = User.new
  end #end new

  def create
    @user = User.new(user_params)
    if @user.save
      #This redirects to the showpage of the newly created user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render 'new'
    end #end if/else
  end #end create

  def edit
  end #end edit

  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render 'edit'
      end #end if/else
  end #end update

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully deleted.'
  end #end destroy

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :home_language)
  end #end post_params

  def find_user
    @user = User.find(params[:id])
  end #end find_user

end
