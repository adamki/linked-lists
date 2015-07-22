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

  def insert(position, data)
    temp = @head
    counter = 1
    while counter != position
      counter += 1
      temp = temp.next_node
    end
    inserted_node = Node.new(data, temp.next_node)
    temp.next_node = inserted_node
    @index += 1
  end

  def pop
    temp = @head
    until temp.next_node == tail
      temp = temp.next_node
    end
    temp.next_node = nil
    @index -= 1
  end

  def include?(item)
    temp = @head
    found = false
    until temp.data == item || temp.next_node == nil
      temp = temp.next_node
    end
    found = true if temp.data == item
    found
  end

  def count
    @index
  end



end
