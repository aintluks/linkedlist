require "minitest/autorun"
require_relative '../linkedlist'

class LinkedListTest < Minitest::Test
  def setup
    @node = LinkedList.new
  end

  def test_init_linkedlist
    assert_nil @node.head
    assert_equal [], @node.list_all
  end

  def test_insert_first_node
    new_node = @node.insert('First node')

    assert_nil new_node.next
    assert_equal new_node, @node.head
    assert_equal 'First node', new_node.data
    assert_equal Node, new_node.class
    assert_equal 1, @node.length
    assert_equal ['First node'], @node.list_all
  end

  def test_insert_two_nodes
    new_node_one = @node.insert('First node')
    new_node_two = @node.insert('Second node')

    assert_nil new_node_two.next
    assert_equal new_node_one, @node.head
    assert_equal 'Second node', new_node_two.data
    assert_equal 2, @node.length
    assert_equal ['First node', 'Second node'], @node.list_all
  end

  def test_insert_three_nodes
    new_node_one = @node.insert('First node')
    new_node_two = @node.insert('Second node')
    new_node_three = @node.insert('Third node')

    assert_nil new_node_three.next
    assert_equal new_node_one, @node.head
    assert_equal 'Third node', new_node_three.data
    assert_equal 3, @node.length
    assert_equal ['First node', 'Second node', 'Third node'], @node.list_all
  end

  def test_delete_first_element
    @node.insert('First node')
    @node.delete('First node')
    
    assert_nil @node.head
    assert_equal 0, @node.length
    assert_equal [], @node.list_all
  end

  def test_delete_second_element
    @node.insert('First node')
    @node.insert('Second node')
    @node.delete('Second node')
    
    assert_equal 1, @node.length
    assert_equal ['First node'], @node.list_all
  end

  def test_delete_second_element_of_three
    @node.insert('First node')
    @node.insert('Second node')
    @node.insert('Third node')
    @node.delete('Second node')
    
    assert_equal 2, @node.length
    assert_equal ['First node', 'Third node'], @node.list_all
  end

  def test_delete_third_element_of_three
    @node.insert('First node')
    @node.insert('Second node')
    @node.insert('Third node')
    @node.delete('Third node')
    
    assert_equal 2, @node.length
    assert_equal ['First node', 'Second node'], @node.list_all
  end

  def test_delete_nonexistent_element
    @node.insert('First node')
    @node.insert('Second node')
    @node.delete('Fourth node')
    
    assert_equal 2, @node.length
    assert_equal ['First node', 'Second node'], @node.list_all
  end

  def test_delete_nonexistent_one_element
    @node.insert('First node')
    @node.delete('Fourth node')
    
    assert_equal 1, @node.length
    assert_equal ['First node'], @node.list_all
  end

  def test_each_nonexistent_data
    each = @node.each { |n| n }
    assert_nil each
  end

  def test_each_one_data
    @node.insert('First node')
    @node.insert('Second node')
    result = []

    @node.each { |n| result << n }
    assert_equal ['First node', 'Second node'], result
  end
end