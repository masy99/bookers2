class BooksController < ApplicationController

  before_action :authenticate_user!,only:[:index,:new,:show]

  def index
  	@book = Book.new
  	@Books = Book.all
    @User = current_user
  end

  def show
    @bookdetail = Book.find(params[:id])
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end
  end

  def new
    @Books = Book.new
  end

  def create
  	@book = current_user.books.build(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      @Books = Book.all
      render "index"
    end

  end

  def update
    user = Book.find(params[:id])
    user.update(book_params)
    redirect_to book_path(user)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

   private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
