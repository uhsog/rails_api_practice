require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test 'validate name length' do
    author = Author.new(name: 'a' * 255)
    assert_not author.valid?
  end
end
