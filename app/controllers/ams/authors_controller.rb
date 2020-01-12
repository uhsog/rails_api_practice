# frozen_string_literal: true

module Ams
  class AuthorsController < ApplicationController
    def index
      authors = Author.all
      render json: authors, adapter: :json
    end

    def show
      author = Author.find(params[:id])
      render json: author, adapter: :json
    end

    def create
      author = Author.new(author_params)
      if author.save
        render json: author, adapter: :json, status: :created
      else
        render json: { error: author.errors }, status: :unprocessable_entity
      end
    end

    def update
      author = Author.find(params[:id])
      if author.update(author_params)
        render json: author, adapter: :json, status: :ok
      else
        render json: { error: author.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      author = Author.find(params[:id])
      author.destroy
      head :no_content
    end

    private

    def author_params
      params.require(:author).permit(:name, :birth, :from)
    end
  end
end
