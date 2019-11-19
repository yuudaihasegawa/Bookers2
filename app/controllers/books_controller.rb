class BooksController < ApplicationController
  before_action :authenticate_user!

  before_action :corrent_book, only: [:edit,:update]
  def corrent_book
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end



  def index
  	@books = Book.all
    @book_new = Book.new
    @user = User.find(current_user.id)
  end

  def create
    @user = current_user
  	@books = Book.all
  	@book_new = Book.new(book_params)
  	@book_new.user_id = current_user.id
  	if @book_new.save
      redirect_to book_path(@book_new.id)
      flash[:notice] = "Book was successfully Create."
  	else
  	  render action: :index
  	end
  end

  def show
    @book_new = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def new
  	@book_new = Book.new
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  def update
  	@books = Book.all
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book)
      flash[:notice] = "Book was successfully updated."
    else
      render action: :edit
    end

  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
