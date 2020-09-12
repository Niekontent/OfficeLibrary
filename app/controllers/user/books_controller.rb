class User::BooksController < ApplicationController

  def index
    @user_books = current_user.books
  end

  def borrow
    book = Book.where(user_id: nil).find(params[:id])
    if book
      current_user.books << book
      redirect_to books_path, flash: { info: 'Enjoy the book!' }
    end
  end

  def return
    book_to_return = Book.where(user_id: current_user.id).find(params[:id])
    book_to_return.update(user_id: nil)
    redirect_to books_path, flash: { info: 'The book was successfully returned' }
  end
end