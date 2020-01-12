# frozen_string_literal: true

module Ams
  class AuthorSerializer < ActiveModel::Serializer
    attributes :id, :name, :birth, :from
  end
end
