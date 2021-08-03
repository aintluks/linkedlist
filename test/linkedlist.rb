require "minitest/autorun"
require_relative '../linkedlist'

class LinkedListTest < Minitest::Test
  def setup
    @node = LinkedList.new
  end

  def test_insert_first_node
    new_node = @node.insert('First node')

    assert_equal new_node, @node.head
    assert_equal Node, new_node.class
  end
end