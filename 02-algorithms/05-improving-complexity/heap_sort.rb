require_relative 'max_binary_heap'

def heapify(collection)
    heap = MaxBinaryHeap.new
    collection.each do |node|
        heap.insert(node)
    end
    
    return heap.array
end

def swap(collection)
    if collection.size == 1
        collection
    else
        temp = collection.first
        collection[0] = collection[collection.size - 1]
        collection[collection.size - 1] = temp
        collection
    end
end

def heap_sort(collection)
  final = []
  while collection.size > 0
      collection = swap(heapify(collection))
      perp = collection.pop
      final.unshift(perp)
  end
  return final
end

