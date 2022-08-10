class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  # before_action :acthenticate_user!

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end
