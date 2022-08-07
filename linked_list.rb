# frozen_string_literal: true

# LinkedList class containing list and methods to access it
class LinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(*input)
    @size = 0
    input&.each { |val| append(val) }
  end

  def append(value = nil)
    new_node = Node.new(value)
    @head = new_node if @head.nil?
    @tail&.next_node = new_node
    @tail = new_node
    @size += 1
  end

  def prepend(value = nil)
    new_node = Node.new(value, @head)
    @tail = new_node if @tail.nil?
    @head = new_node
    @size += 1
  end
end

# Node class to hold single node in list
class Node
  attr_accessor :next_node, :value

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Variable test conditions below
list = LinkedList.new('test0', 'test1', 'test2')
list.prepend('test3')
a = 1
