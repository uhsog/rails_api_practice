class Jb::AuthorsController < ApplicationController
  def index
    @authors = Author.all

    render :template => 'jb/authors/index.json.jb'
  end

  def show
    @author = Author.find(params[:id])

    render :template => 'jb/authors/show.json.jb'
  end
end
