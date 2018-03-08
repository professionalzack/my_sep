require 'benchmark'
require_relative 'quick_sort'
require_relative 'heap_sort'
require_relative 'bucket_sort'
require_relative 'insertion_sort'
require_relative 'bubble_sort'
require_relative 'selection_sort'
require_relative 'merge_sort'

array = [73, -2, 93, 145, 62, 11, 180, 199, 68, 190, 96, 2, -15, 102, 57, 41, 15, 125, 27, 69, 64, 98, 90, 113, 105, 154, -9, 165, -3, 137, 91, 10, 200, -13, 188, 54, 103, 162, -6, -14, 129, 168, 55, 92, 12, 147, 149, 161, 5, -7]

puts "Quick Sort: " + Benchmark.measure { 
    
    quick_sort(array)
    
}.to_s

puts "Heap Sort: " + Benchmark.measure {
    
    heap_sort(array)
    
}.to_s

puts "Bucket Sort: " + Benchmark.measure {
   
    bucket_sort(array)
    
}.to_s

puts "Merge Sort: " + Benchmark.measure { 
    
    merge_sort(array)
    
}.to_s

puts "Insertion: " + Benchmark.measure {
    
    insertion_sort(array)
    
}.to_s

puts "Bubble Sort: " + Benchmark.measure {
   
    bubble_sort(array)
    
}.to_s

puts "Selection Sort: " + Benchmark.measure {
   
    selection_sort(array)
    
}.to_s