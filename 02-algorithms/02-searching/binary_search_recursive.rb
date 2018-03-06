def binary_search(collection, value)
    low = 0
    high = collection.size - 1

    while low <= high
        mid = (low + high) / 2
        if collection[mid] == value
            return collection[mid].to_s
        elsif collection[mid] > value 
            new_collection = collection[0..mid - 1]
            return binary_search(new_collection, value)

        elsif collection[mid] < value
            new_collection = collection[mid + 1..high]
            return binary_search(new_collection, value)

        end
    end
    return "not found"
end