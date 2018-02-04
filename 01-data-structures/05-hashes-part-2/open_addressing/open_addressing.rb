require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    code = self.index(key, size)
    if @items[code] == nil
      @items[code] = Node.new(key, value)
    elsif @items[code].key == key && @items[code].value == value
      return
    else
      newInd = self.next_open_index(code)
      if @items[code].key == key && @items[code].value != value && newInd == -1
        self.resize
        @items[newInd].value = value
      elsif newInd == -1
        self.resize
        self[key] = value
      else
        @items[newInd] = Node.new(key, value)
        @items[newInd].value = value
      end
    end
  end

  def [](key)
    keyIndex = self.index(key, size)
    while keyIndex < size
      if @items[keyIndex].key == key
        return @items[keyIndex].value
      else
        keyIndex += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    if index === 0 || (index + 1) >= @items.length
      return -1
    end
    while (index + 1) < @items.length do
      if @items[index].nil?
        return index
      else
        index += 1
      end
    end
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    @size = @items.length * 2
    oldArr = @items
    @items = Array.new(@size)
    oldArr.each do |item|
      next unless item
        code = self.index(item.key, @items.length)
        @items[code] = Node.new(item.key, item.value)
    end
  end
  def state
    @items.each do |item|
      next unless item
        puts "key " +item.key+" & value "+item.value+"."
      
    end

  end
end