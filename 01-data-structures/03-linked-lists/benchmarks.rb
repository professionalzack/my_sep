require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000

llist = LinkedList.new
i = 1

puts "Array: " + Benchmark.measure { 
    
    array = (1..n).to_a
    array.fetch(4999)
}.to_s

puts "Linked List: " + Benchmark.measure {
    while i <= n  do
   llist.add_to_tail(i.to_s)
   i +=1
    end
    llist.locate("5000").data
    
}.to_s


