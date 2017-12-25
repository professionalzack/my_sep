class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)

      @stack << item
      self.top = item

  end

  def pop
    popped = self.top
    @stack.delete(top)
    self.top = @stack[@stack.length - 1]
    popped
  end

  def empty?
    if self.top == nil
      return true
    else
      return false
    end
  end
end