require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get ams_authors_url
    assert_response :success
  end

  test 'should get show' do
    get ams_author_url(authors(:one))
    assert_response :success
  end

  test 'should post create' do
    params = { author: { name: 'TestName', birth: Date.current } }
    records = Author.count
    post ams_authors_url(params)
    assert_response :success
    assert_equal records + 1, Author.count
  end

  test 'shuld post not create without name' do
    params = { author: { birth: Date.current } }
    post ams_authors_url(params)
    assert_response :unprocessable_entity
  end

  test 'should put update' do
    params = { author: { name: 'TestName' } }
    put ams_author_url(authors(:one), params)
    assert_response :success
    assert_equal 'TestName', Author.find(authors(:one).id).name
  end

  test 'should put not update, because name length over' do
    params = { author: { name: 'a' * 256 } }
    put ams_author_url(authors(:one), params)
    assert_response :unprocessable_entity
  end

  test 'should delete destroy' do
    author = Author.create(name: 'Test Author')
    records = Author.count
    delete ams_author_url(author)
    assert_response :no_content
    assert_equal records - 1, Author.count
  end
end
