# frozen_string_literal: true

module Ams
  class BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :isbn, :publication_on, :author

    def author
      instance_options[:without_serializer] ? object.author : AuthorSerializer.new(object.author, without_serializer: true)
    end
  end
end
