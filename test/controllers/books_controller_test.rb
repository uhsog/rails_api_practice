require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get ams_books_url
    assert_response :success
  end

  test 'should get show' do
    get ams_book_url(books(:one))
    assert_response :success
  end

  test 'should post create' do
    params = { book: { title: 'TestTitle', isbn: 1234567890123, author_id: authors(:one).id } }
    records = Book.count
    post ams_books_url(params)
    assert_response :success
    assert_equal records + 1, Book.count
  end

  test 'shuld post not create without title' do
    params = { book: { title: 'TestTitle' } }
    post ams_books_url(params)
    assert_response :unprocessable_entity
  end

  test 'should put update' do
    params = { book: { title: 'TestTitleNew' } }
    put ams_book_url(books(:one), params)
    assert_response :success
    assert_equal 'TestTitleNew', Book.find(books(:one).id).title
  end

  test 'should delete destroy' do
    records = Author.count
    delete ams_book_url(books(:one))
    assert_response :no_content
    assert_equal records - 1, Book.count
  end
end
