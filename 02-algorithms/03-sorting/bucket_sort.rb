require_relative 'insertion_sort'

def bucket_sort(collection, bucket_num = 5)
  max = 0
  min = 0
  barrel = []
  for i in collection
    if i > max
      max = i
    elsif i < min
      min = i
    end
  end
  qt = (max - min)/bucket_num
  buckets = Array.new(bucket_num + 1)
  for b in 0..bucket_num
    buckets[b] = Array.new
  end
  
  for i in 0..collection.length - 1
    buckets[((collection[i] - min) / qt)].push(collection[i])
  end
  
  for b in 0..bucket_num
    unless buckets[b].length <= 0
      pail = insertion_sort(buckets[b])
      
      for i in 0..pail.length - 1
        barrel.push(pail[i])
      end
    end
  end
  
  return barrel

end

