class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
     @book = Book.new
     @users = User.all
     @user_id = User.find(current_user.id)
  end

  def show
   @book = Book.new
   @user_id = User.find(params[:id])
   @books = @user_id.books
  end

  def edit
     @user = User.find(params[:id])
     if @user == current_user
        render "edit"
     else
        redirect_to book_path
     end
  end
  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:notice] = 'You have updated user successfully.'
         redirect_to user_path(@user.id)
      else
        render :edit
      end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end



end
