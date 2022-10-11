class BooksController < ApplicationController
  def index
    @book = Book.new
    @user_id = User.find(current_user.id)
    @user_image = User.find(current_user.id)
    @books = Book.all
    @book_id = Book.find(current_user.id)
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to users_path
  end
  def show
    @book = Book.new
    @user_id = User.find(current_user.id)
    @book_id = Book.find(current_user.id)
    @book_params = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
