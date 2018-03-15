require_relative 'merge_sort'
 
def poorly_written_ruby(*arrays)
    merge_sort(arrays.flatten)
end