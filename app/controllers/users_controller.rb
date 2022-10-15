class UsersController < ApplicationController
  def index
     @book = Book.new
     @books = Book.all
     @users = User.all
     @user_id = User.find(current_user.id)
     @user_image = User.find(current_user.id)
  end

  def show
   @book = Book.new
   @users = User.all
   @books = Book.all
   @user = User.find(params[:id])
   @user_id = User.find(current_user.id)
  end

  def edit
     @user = User.find(params[:id])
  end
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:notice] = 'You have updated user successfully.'
         redirect_to user_path(@user.id)
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end



end
