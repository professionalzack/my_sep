require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @items = Array.new(size)
    @max_load_factor = 0.7
    @size = size
  end

  def []=(key, value)
    code = self.index(key, @size)

    @items[code] ||= LinkedList.new
    node = Node.new(key, value)
    @items[code].add_to_front(node)

    resize if self.load_factor > @max_load_factor

  end

  def [](key)
    keyIndex = self.index(key, size)
    @items[keyIndex].find(key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    counter = 0.0
    @items.each do |item|
      next unless item
      counter += item.print
    end
    counter / @size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
   @size *= 2
    old_arr = @items
    @items = Array.new(@size)
    old_arr.each do |item|
      next unless item
      current = item.head
      while current.next
        self[current.key] = current.value
        current = current.next
      end
      self[current.key] = current.value
    end
  end

  def state
    puts "Load factor: " + load_factor.to_s
    @items.each do |item|
      if item != nil
        current = @head
        while current != nil
          puts "key " +current.key+" & value "+current.value+"."
          current = current.next
        end
      end
    end
  end
end
