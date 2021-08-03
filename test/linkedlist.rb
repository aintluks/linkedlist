require "minitest/autorun"
require_relative '../linkedlist'

class LinkedListTest < Minitest::Test
  def setup
    @node = LinkedList.new
  end

  def test_init_linkedlist
    assert_nil @node.head
  end

  def test_insert_first_node
    new_node = @node.insert('First node')

    assert_nil new_node.next
    assert_equal new_node, @node.head
    assert_equal 'First node', new_node.data
    assert_equal Node, new_node.class
    assert_equal 1, @node.length
  end

  def test_insert_two_nodes
    new_node_one = @node.insert('First node')
    new_node_two = @node.insert('Second node')

    assert_nil new_node_two.next
    assert_equal new_node_one, @node.head
    assert_equal 'Second node', new_node_two.data
    assert_equal 2, @node.length
  end

  def test_insert_three_nodes
    new_node_one = @node.insert('First node')
    new_node_two = @node.insert('Second node')
    new_node_three = @node.insert('Third node')

    assert_nil new_node_three.next
    assert_equal new_node_one, @node.head
    assert_equal 'Third node', new_node_three.data
    assert_equal 3, @node.length
  end
end