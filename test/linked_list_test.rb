require "pry";
require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"
require "./lib/linked_list"

class LinkedListTest < Minitest::Test

  def test_that_a_new_list_has_a_nil_data_at_head
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

#========Append========================================================

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

  #can now use append/prepend
  #edge-case example: call append on new list(head only)

  def test_it_can_append_node_directly_to_head
    list = LinkedList.new("Start")
    list.append("here is a node")
    assert_equal "here is a node", list.tail.data
  end

  def test_list_can_append_node_to_single_node_list
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    assert_equal 2, list.tail.data
  end

  #=====Prepend===========================================================

  def test_it_can_prepend_to_beginning_of_list
    list = LinkedList.new("start")
    list.append(3)
    list.append(4)
    list.append(5)
    list.prepend("orange")
    list.prepend("apple")
    assert_equal "apple", list.head.data
  end

  def test_it_can_prepend_twice
    list = LinkedList.new("start")
    list.prepend(1)
    list.prepend(2)
    assert_equal 2, list.head.data
    assert_equal "start", list.tail.data
  end

  def test_list_can_append_and_prepend_consecutively
    list = LinkedList.new("start")
    list.prepend(1)
    list.append(2)
    list.prepend(3)
    assert_equal 2, list.tail.data
    assert_equal 3, list.head.data
  end

#======Insert==========================================================

  def test_it_can_insert_a_new_node
    list = LinkedList.new("start")
    list.append("2thing")
    list.append("3more")
    list.append("4better")
    list.insert(2, "new")
    assert_equal "new", list.head.next_node.next_node.data
  end

#=======Pop=========================================================

  def test_it_can_pop_the_tail_of_list
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    list.pop
    assert_equal 1, list.tail.data
  end

  def test_does_not_break_when_items_are_popped_from_list
    list = LinkedList.new("start")
    list.append("bread")
    list.append("crackers")
    list.append("peanuts")
    list.append("candy")
    list.pop
    assert_equal 4, list.count
  end

  def test_does_not_break_when_items_are_inserted_to_list
    list = LinkedList.new("start")
    list.append("bread")
    list.append("crackers")
    list.append("peanuts")
    list.append("candy")
    list.insert(2, "peanut-butter")
    assert_equal 6, list.count
  end

#=====Include?===========================================================

  def test_it_can_return_boolean_response_for_include?
    list = LinkedList.new("start")
    list.append("fish")
    list.append("cake")
    list.append("wine")
    assert true, list.include?("fish")
  end

  def test_it_can_correctly_return_false_when_using_include
    list = LinkedList.new("start")
    list.append("fish")
    list.append("cake")
    list.append("wine")
    refute list.include?("clowns")
  end

#===count=============================================================

  def test_it_counts_the_number_of_elems_in_list
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    list.prepend(0)
    assert_equal 4, list.index
  end

  def test_it_counts_head_as_a_list_item
    list = LinkedList.new("start")
    assert_equal 1, list.index
  end


  def test_it_can_count_the_size_of_the_list
    list = LinkedList.new("start")
    list.append("bread")
    list.append("crackers")
    list.append("peanuts")
    list.append("candy")
    assert_equal 5, list.count
  end

#=====Return Head===========================================================

  def test_it_can_return_the_head_value
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    assert_equal "start", list.head.data
    list.append(3)
    list.prepend(4)
    assert_equal 4, list.head.data
  end

#======Return Tail=====================================================

  def test_it_can_return_the_tail_value
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    assert_equal 2, list.tail.data
    list.append(3)
    list.prepend(4)
    assert_equal 3, list.tail.data
  end

#=====find_by_index====================================================

  def test_it_can_find_a_node_by_index
    list = LinkedList.new("start")
    list.append("tapatio")
    list.append("chilula")
    list.append("sriracha")
    assert_equal 2, list.find_by_index(index)
  end





end
