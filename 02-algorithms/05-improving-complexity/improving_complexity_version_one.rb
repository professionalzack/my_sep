def poorly_written_ruby(*arrays)
   combined_array = arrays.flatten!

   sorted_array = [combined_array.pop]
   

    combined_array.each do |val|
      i = 0
      while i < sorted_array.length
        if val <= sorted_array[i]
          sorted_array.insert(i, val)
          break
        elsif i == sorted_array.length - 1
          sorted_array.insert(i + 1, val)
          break
        end

        i += 1
      end
    end

  return sorted_array.to_s
end