class User::BooksController < ApplicationController

  def index
    @user_books = current_user.books
  end

  def borrow
    book = Book.where(user_id: nil).find(params[:book_id])

    if book
      current_user.books << book
      flash = { success: 'Enjoy the book!' }
    else
      flash = { alert: 'Book not available' }
    end

    redirect_to books_path, flash: flash
  end

  def return
    book_to_return = Book.where(user_id: current_user.id).find(params[:book_id])
    book_to_return.update(user_id: nil)

    redirect_to books_path, flash: { info: 'The book was successfully returned' }
  end
end