class BooksController < ApplicationController
  before_action :set_book, only: %i(show edit update destroy)

  def index
    @books = Book.all
  end

  def show; end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to books_path, flash: { success: 'The book was successfully updated' }
    else
      render :edit
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.creator_id = current_user.id

    if @book.save
      redirect_to books_path, flash: { success: 'The book was successfully added to the library!' }
    else
      render :new
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, flash: { success: 'The book was successfully destroyed' }
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :description)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end