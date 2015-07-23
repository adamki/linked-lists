
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

  def test_it_can_insert_on_a_brand_new_list
    list = LinkedList.new("start")
    list.insert(1, "new")
    assert_equal "new", list.head.next_node.data
  end

  def test_it_cannot_insert_on_or_before_head
    list = LinkedList.new("start")
    list.insert(0, "new")
    assert_equal nil, list.insert(0, "new")
    assert_equal "start", list.head.data
  end

  def test_it_does_not_insert_to_a_non_existent_position
    list = LinkedList.new("start")
    list.append("2thing")
    list.append("3more")
    list.append("4better")
    list.insert(7, "This space does not exist")
    assert_equal nil, list.find_by_index(7)
  end

  def test_that_inserting_after_tail_returns_nil
    #is_the_same_as_append
    list = LinkedList.new("start")
    list.append("2thing")
    list.append("3more")
    list.append("4better")
    list.insert(5, "This is an append")
    assert_equal nil, list.find_by_index(5)
  end

  # def test_it_does_not_insert_to_a_negative_position
  #   list = LinkedList.new("start")
  #   list.append("2thing")
  #   list.append("3more")
  #   list.append("4better")
  #   list.insert(-1, "This space does not exist")
  #   assert_equal nil, list.find_by_index(-1)
  # end

#=======Pop=========================================================

  def test_it_can_pop_the_tail_of_list
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    list.pop
    assert_equal 1, list.tail.data
  end

  def test_that_list_count_correctly_reflects_pop_event
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
    list.pop
    assert_equal 5, list.count
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

  def test_it_can_return_head_data
    list = LinkedList.new("start")
    assert_equal "start", list.head.data
  end

  def test_it_can_return_the_head_value_amonst_other_nodes
    list = LinkedList.new("start")
    list.append(1)
    list.append(2)
    assert_equal "start", list.head.data
    list.append(3)
    list.prepend(4)
    assert_equal 4, list.head.data
  end

#======Return Tail=====================================================

  def test_it_can_return_tail_value
    list = LinkedList.new("start")
    assert_equal "start", list.tail.data
  end

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
    list.append("tabasco")
    assert_equal "sriracha", list.find_by_index(3)
  end

  def test_it_can_find_head_data_at_zero_index
    list = LinkedList.new("start")
    assert_equal "start", list.find_by_index(0)
  end

  def test_it_can_find_a_node_by_if_list_length_is_only_one
    list = LinkedList.new("start")
    list.append("tapatio")
    assert_equal "tapatio", list.find_by_index(1)
  end

  def test_it_returns_nil_if_search_param_doesnt_exist
    list = LinkedList.new("start")
    list.append("tapatio")
    assert_equal nil, list.find_by_index(3)
  end

#=====find_by_value====================================================

  def test_it_can_find_node_position_by_data
    list = LinkedList.new("start")
    list.append("tapatio")
    list.append("chilula")
    list.append("sriracha")
    list.append("tabasco")
    assert_equal 2, list.find_by_data("chilula")
    assert_equal 0, list.find_by_data("start")
  end

  def test_it_can_find_node_if_value_is_at_beginning
    list = LinkedList.new("start")
    list.append("tapatio")
    list.append("chilula")
    list.append("sriracha")
    assert_equal 0, list.find_by_data("start")
  end

  def test_it_can_find_node_if_value_is_at_end
    list = LinkedList.new("start")
    list.append("tapatio")
    list.append("chilula")
    list.append("sriracha")
    assert_equal 3, list.find_by_data("sriracha")
  end

  #=====remove_by_index==================================================

  def test_it_can_remove_a_node_by_index
    list = LinkedList.new("start")
    list.append("tabasco")
    list.append("chilula")
    list.append("sriracha")
    list.remove_by_index(1)
    assert_equal "chilula", list.find_by_index(1)
    list.remove_by_index(1)
    assert_equal "sriracha", list.find_by_index(1)
  end

  def test_it_can_not_remove_head_node
    list = LinkedList.new("start")
    list.append("tabasco")
    list.append("chilula")
    list.remove_by_index(0)
    assert_equal "start", list.find_by_index(0)
    assert_equal "tabasco", list.find_by_index(1)
  end

  # def test_it_can_not_remove_node_that_does_not_exist
  #   skip
  #   list = LinkedList.new("start")
  #   list.append("tabasco")
  #   list.append("chilula")
  #   list.remove_by_index(5)
  #   assert_equal nil, list
  # end

    #=====remove_by_value==================================================

  def test_it_can_remove_a_node_by_value
    list = LinkedList.new("start")
    list.append("chilula")
    list.append("sriracha")
    list.append("tapatio")
    list.remove_by_data("chilula")
    assert_equal "tapatio", list.find_by_index(2)
  end




end
