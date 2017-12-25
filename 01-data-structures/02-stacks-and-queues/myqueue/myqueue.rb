class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[@queue.length-1]

  end

  def dequeue
    nextUp = @head
    @queue.delete(head)
    @head = @queue[0]
    @tail = @queue[@queue.length-1]

  end

  def empty?
    if @queue.length === 0 
      return true
    else
      return false
    end
  end
end