require "pry";
require 'minitest/autorun'
require 'minitest/pride'
require "./node"
require "./linked_list"

class LinkedListTest < Minitest::Test

  def test_a_new_list_has_a_nil_head
    list = LinkedList.new
    result = list.head
    assert_equal nil, result.data
  end

  def test_a_new_list_has_a_head
    list = LinkedList.new("Start")
    result = list.head
    assert_equal "Start", result.data
  end

  def test_tail_can_be_found
    node4 = Node.new(4)
    node3 = Node.new(3, node4)
    node2 = Node.new(2, node3)
    node1 = Node.new(1, node2)
    list = LinkedList.new("start", node1)
    assert_equal 4, list.tail.data
  end

  def test_it_appends_node_to_list
    node4 = Node.new(4)
    node3 = Node.new(3, node4)
    node2 = Node.new(2, node3)
    node1 = Node.new(1, node2)
    list = LinkedList.new("start", node1)
    assert_equal 4, list.tail.data
    list.append(5)
    assert_equal 5, list.tail.data
  end

  #edge-case example: call append on new list(head only)

  def test_it_can_prepend_to_beginning_of_list
    node5 = Node.new(5)
    node4 = Node.new(4, node5)
    node3 = Node.new(3, node4)
    node2 = Node.new(2, node3)
    list = LinkedList.new("start", node2)
    list.prepend("apple")
    assert_equal "apple", list.head.data
  end

  #can now use append

  def test_it_can_insert_a_new_node

    list = LinkedList.new("start")
    list.append("thing")
    list.append("more")
    list.append("better")
    binding.pry
    list.insert(2, "new")

    assert_equal "thing", head.next_node.data
  end






  def test_empty_list_can_append_node
    skip
    list = LinkedList.new
    node = Node.new("data")
    list.append(node)
    assert_equal node, list.head
  end

  def test_list_with_one_node_can_append_second_node
    skip
    list = LinkedList.new
    node = Node.new("data")
    node2 = Node.new("data2")
    list.append(node)
    list.append(node2)
    assert_equal node2, list.head.next_node
  end

  def test_liost_with_two_nodes_can_append_third_node
    skip
    list = LinkedList.new
    node = Node.new("data")
    node2 = Node.new("data2")
    node3 = Node.new("data3")
    list.append(node)
    list.append(node2)
    list.append(node3)
    assert_equal node2, list.head.next_node
  end

  def test_prepend_two_nodes_to_list_beginning
    skip
    list = LinkedList.new
    node = Node.new("Adam")
    list.prepend(node)
    assert_equal node, list.head
  end

end
