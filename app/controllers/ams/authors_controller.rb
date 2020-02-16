# frozen_string_literal: true

module Ams
  class AuthorsController < ApplicationController
    before_action :set_author, only: %i[show update destroy]

    def index
      authors = Author.all
      render json: authors, adapter: :json
    end

    def show
      render json: @author, adapter: :json
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
      if @author.update(author_params)
        render json: @author, adapter: :json, status: :ok
      else
        render json: { error: @author.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      @author.destroy
      head :no_content
    end

    private

    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :birth, :from)
    end
  end
end
