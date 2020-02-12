require 'test_helper'

class BookTest < ActiveSupport::TestCase
  setup do
    @author = Author.create(name: 'Test Author')
  end

  test 'valid title' do
    book = Book.new(title: 'hoge', author: @author)
    assert book.valid?
  end

  test 'invalid title' do
    book = Book.new(title: nil, author: @author)
    assert book.invalid?
    assert_includes book.errors[:title], "can't be blank"
  end
end
