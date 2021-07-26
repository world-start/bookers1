class BooksController < ApplicationController
  def new

  end

  def create
    @book = Book.new(book_params)


    # サクセス・エラーメッセージ部分
    if @book.save
      flash[:notice] = "successfully"
      redirect_to '/books'
    else
      @books = Book.all
      render :index
    end

  end


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    flash[:notice] = "successfully"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "successfully"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
