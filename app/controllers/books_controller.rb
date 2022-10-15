class BooksController < ApplicationController
  def index
    @book = Book.new
    @user_id = User.find(current_user.id)
    @user_image = User.find(current_user.id)
    @books = Book.all
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = 'You have created book successfully.'
       redirect_to book_path(@book.id)
    else
      @user_id = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end
  def show
    @book = Book.new
    @books = Book.all
    @user_id = User.find(current_user.id)
    @book_params = Book.find(params[:id])
  end
  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
