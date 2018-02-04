require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
    def add_to_tail(nodeData)
    node = Node.new(nodeData)
    temp = @head
    if @head == nil
      @head = node
      @tail = node
    else
      while temp.next != nil
        temp = temp.next
      end
      temp.next = node
      @tail = temp.next
      @tail.next = nil
    end
  end
  

  # This method removes the last node in the lists and must keep the rest of the list intact.
    def remove_tail
    temp = @head
    if @head == @tail
      @tail = nil
    else
      while temp.next != nil && temp.next != @tail
        temp = temp.next
      end
      @tail = temp
      @tail.next = nil
    end
  end

  # This method prints out a representation of the list.
  def print
    count = 0
    current = @head
    while current.next != nil
      count += 1
      current = current.next
    end
    count + 1
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    temp = @head
    if temp.data == node
      @head = temp.next
    end
    while temp.next != nil
      if temp.next.data == node
        if temp.next == @tail
          @tail = temp
          @tail.next = nil
        else
          temp.next = temp.next.next
        end
      else
        temp = temp.next
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    oldHead = @head
    @head = node
    temp = @head
    temp.next = oldHead
    
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  def find(key)
    return @head.value if @head.key == key

    current = @head.next
    until current.key == key
      current = current.next
      return nil unless current
    end
    current.value
  end
end