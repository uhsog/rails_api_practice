# frozen_string_literal: true

module Ams
  class BooksController < ApplicationController
    before_action :set_book, only: %i[show destroy update]

    def index
      # books = Book.preload(:author).paginate(page: params[:page])
      books = Book.all.preload(:author)
      render json: books, adapter: :json
    end

    def show
      render json: @book, adapter: :json
    end

    def create
      book = Book.new(book_params)
      if book.save
        render json: book, adapter: :json, status: :created
      else
        render json: { error: book.errors }, status: :unprocessable_entity
      end
    end

    def update
      if @book.update(book_params)
        render json: @book, adapter: :json, status: :ok
      else
        render json: { error: @book.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @book.destroy
      head :no_content
    end

    private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :isbn, :publication_on, :author_id)
    end
  end
end
