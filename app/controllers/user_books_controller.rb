class UserBooksController < ApplicationController
    def create
        user_book = UserBook.new(user_id: params[:user_id], book_id: params[:book_id])
        if user_book.save
            book = Book.find(params[:book_id])
            render json: book
        else
            render json: {error: "Error adding book to user's collection."}
        end
    end
end
