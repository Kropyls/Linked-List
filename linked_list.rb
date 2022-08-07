# frozen_string_literal: true

# LinkedList class containing list and methods to access it
class LinkedList
  attr_reader :size, :head, :tail

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

  def at(index)
    raise "index #{index} is out of range" unless (0...@size).include?(index)

    target = @head
    index.times do
      target = target.next_node
    end
    target
  end

  def pop
    raise "Can't pop an empty list" if @size.zero?

    popped = @tail
    @tail = at(@size - 2)
    @tail.next_node = nil
    @size -= 1
    popped
  end

  def contains?(value)
    target = @head
    # safe nav operator in case @head is nil
    until target&.next_node.nil?
      return true if target.value == value

      target = target.next_node
    end
    false
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
list = LinkedList.new('test0', 'test1', 'test2', 'test3', 'test4')
x = list.contains?('test2')
y = list.contains?('test5')
a = 1
