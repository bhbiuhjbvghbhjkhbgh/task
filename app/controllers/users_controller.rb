class UsersController < ApplicationController
  def index
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path
  end

  def show
   @user = User.find(params[:id])
  end

  private

  def book_params
    params.require(book).permit(:title, :body, :user_id)
  end

end
