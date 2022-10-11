class BooksController < ApplicationController
  def index
    @book = Book.new
    @user_id = User.find(current_user.id)
    @user_image = User.find(current_user.id)
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to users_path
  end
  def show
  end

  private

  def book_params
    params.permit(:title, :body, :user_id)
  end

end
