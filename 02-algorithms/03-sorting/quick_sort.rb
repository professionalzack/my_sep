def quick_sort(collection)
  if collection.length <= 1
    return collection
  end
  left = []
  right = []
  new = []
  pivot = collection[collection.length-1]
  i = 0
  while collection[i] != pivot
    if collection[i] > pivot
      right.push(collection[i])
    elsif collection[i] < pivot
      left.push(collection[i])
    end
    i = i + 1 
  end
  
  lwing = quick_sort(left)
  rwing = quick_sort(right)
  
  lwing.each do |n|
    new.push(n)
  end
  new.push(pivot)
  rwing.each do |n|
    new.push(n)
  end
  
  new
  
end