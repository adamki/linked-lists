require "pry";

class LinkedList
  attr_accessor :head, :index

  def initialize(data = nil, next_node = nil)
    @head = Node.new(data, next_node)
    @index = 1
  end

  def self.index
    @index
  end

  def tail
   temp = @head
   until temp.next_node == nil
     temp = temp.next_node
   end
    temp
  end

  def append(data)
    tail.next_node = Node.new(data)
    @index += 1
  end

  def prepend(data)
    new_head = Node.new(data, @head)
    @head = new_head ##reassign head to new_head
    @index += 1
  end

  def insert(position, value)
    temp = @head
    until position == index
      temp = temp.next_node
    end
    temp_next_node = temp.next_node
    temp.next_node = Node.new(value, temp_next_node)
  end

  def include?(item)
    temp = @head
    until temp.data == item
      temp = temp.next_node
      false
    end
    true
  end

end

















# new_list = List.new
# new_list.append("this is my data")
# node = Node.new("this is my data")
# new_list.append(node)
