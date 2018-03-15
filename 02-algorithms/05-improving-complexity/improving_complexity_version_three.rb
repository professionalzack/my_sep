require_relative 'heap_sort'

def poorly_written_ruby(*arrays)
    heap_sort(arrays.flatten)
end
