class UsersController < ApplicationController
  def index
     @book = Book.new
     @user_id = User.find(current_user.id)
     @user_image = User.find(current_user.id)
  end
  def create
    @book = Book.new(user_params)
    @book.user_id = current_user.id
    @user.save
    redirect_to users_path(current_user.id)
  end

  def show
   @user = User.find(params[:id])
  end

  def edit
     @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(user).permit(:name, :introduction, :profile_image)
  end

end
