require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @size = size
  end

  def []=(key, value)
    code = key.is_a?(Numeric) ? key : index(key, @size)
    if @items[code].nil? || @items[code][1] == value
      @items[code] = [key, value]
    elsif key == @items[code][0]
      @items[code] << value
    else
      next_open_index(index(key, @items.size))
      #self[key] = value
    end
  end

  def [](key)
    keyIndex = index(key, @size)
    @items[keyIndex][1]
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    return key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < @items.length do
      if @items[index].nil?
        return index
      else
        index += 1
      end
    end
    if index >= @items.length
      return -1
    end

  end

  # Simple method to return the number of items in the hash
  def size
    counter = 0
    @items.each do |item|
      if item.nil?
        counter += 1
      else
        counter += item.length - 1
      end
    end
    counter
  end

  # Resize the hash
  def resize
    @size *= 2
    oldArr = @items
    @items = Array.new(@size)
    oldArr.each do |item|
      next unless item
      code = index(item[0], @size)
      @items[code] = item
    end
  end
end