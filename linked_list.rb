# frozen-string-literal: true

# LinkedList class
class LinkedList
  attr_accessor :head, :tail

  def initialize
    self.head = nil
    self.tail = nil
  end

  def prepend(value)
    unless head.nil?
      self.tail = head unless head.next_node.nil?
    end
    self.head = Node.new(value, head)
  end

  def append(value)
    prepend(value) if head.nil?
    tmp = head
    tmp = tmp.next_node until tmp.next_node.nil?
    tmp.next_node = Node.new(value, nil)
    self.tail = tmp.next_node
  end

  def size
    count = 1
    tmp = head
    until tmp.next_node.nil?
      tmp = tmp.next_node
      count += 1
    end
    count
  end

  def at(index)
    num = 0
    tmp = head
    return tmp if num == index

    until tmp.next_node.nil?
      tmp = tmp.next_node
      num += 1
      return tmp if num == index
    end
    'Index too big!'
  end

  def pop
    tmp = head
    tmp = tmp.next_node until tmp.next_node == tail
    tmp.next_node = nil
  end

  def contains?(value)
    tmp = head
    return true if head.value == value

    until tmp.next_node.nil?
      tmp = tmp.next_node
      return true if tmp.value == value
    end
    false
  end

  def find(value)
    num = 0
    tmp = head
    return 0 if head.value == value

    until tmp.next_node.nil?
      tmp = tmp.next_node
      num += 1
      return num if tmp.value == value
    end
    'nil'
  end

  def to_s
    list_string = ''
    tmp = head
    until tmp.next_node.nil?
      list_string += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end
    list_string += "( #{tmp.value} ) -> nil"
    list_string
  end

  #--------------------------------------#
  # EXTRA CREDIT: #insert_at, #remove_at #
  #--------------------------------------#

  def insert_at(value, index)
    tmp = head
    num = 0
    return prepend(value) if index.zero?

    until tmp.next_node.nil? && !index.zero?
      if num == index - 1
        node1 = tmp
        node2 = tmp.next_node
        node1.next_node = Node.new(value, node2)
        break
      end
      tmp = tmp.next_node
      num += 1
    end
    'enter a valid index' if num != index
  end

  def remove_at(index)
    tmp = head
    num = 0
    until tmp.next_node.nil? && !index.zero?
      if num == index - 1
        tmp.next_node = tmp.next_node.next_node
        break
      end
      tmp = tmp.next_node
      num += 1
    end
    self.head = head.next_node if index.zero?
  end

  # Node Class
  class Node
    attr_accessor :value, :next_node

    def initialize(value = nil, next_node = nil)
      self.value = value
      self.next_node = next_node
    end
  end
end

list = LinkedList.new
list.prepend(3)
list.prepend(11)
list.prepend(23)
list.prepend(78)
list.prepend(4)
list.prepend(56)

puts list

list.insert_at(100, 0)

list.remove_at(3)
puts list
