require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test 'validate name length' do
    author = Author.new(name: 'a' * 999)
    assert_not author.valid?
  end
end
