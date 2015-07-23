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
      if position > count || position == 0
        return nil
      end
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

  def find_by_index(index)
    temp = @head
    count = 0
    # until count == index || !temp
    while temp && count < index
      temp = temp.next_node
      count += 1
    end
    temp && temp.data
  end

  def find_by_data(item)
    temp = @head
    found = false
    count = 0
    until temp.data == item || temp.next_node == nil
      temp = temp.next_node
      count += 1
    end
    found = true if temp.data == item
    if found
      count
    else
      nil
    end
  end

  def remove_by_index(index)
    temp = @head
    count = 0
    if index < 1
      @head = head
      return
    end
    until count == index
      temp.next_node = temp.next_node
      count += 1
    end
    temp.next_node = temp.next_node.next_node
  end

  def remove_by_data(item)
    temp = @head
    until temp.next_node.data == item #|| temp.next_node == nil
      temp = temp.next_node
    end
    temp.next_node = temp.next_node.next_node
  end

  def find_distance(node_1, node_2)
    (find_by_data(node_1)-find_by_data(node_2)).abs
  end

end
