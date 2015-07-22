# require 'simplecov'
# SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require "./lib/node"
require "./lib/linked_list"

class Listtest < Minitest::Test
  def test_nil_node
    node1 = Node.new
    assert_equal nil, node1.data
    assert_equal nil, node1.next_node
  end

  def test_non_nil_node
    node1 = Node.new("justin")
    assert_equal "justin", node1.data
    assert_equal nil, node1.next_node
  end

  def test_node_knows_next_node
    node1 = Node.new("justin", Node.new(2))
    assert_equal "justin", node1.data
    assert_equal 2, node1.next_node.data
  end

  def test_node_knows_next_node
    node1 = Node.new("justin", Node.new(2, Node.new(3)))
    assert_equal "justin", node1.data
    assert_equal 2, node1.next_node.data
    assert_equal 3, node1.next_node.next_node.data
  end

end
