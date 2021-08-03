class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to "/books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end
  
  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @book_comment = BookComment
  end
  
  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path
    else
      render :edit
    end
  end
  
  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end
