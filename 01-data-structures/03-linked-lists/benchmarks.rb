require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

n = 10000

llist = LinkedList.new
i = 1



puts "Array creation: " + Benchmark.measure { 
    
    array = (1..n).to_a
    
}.to_s

puts "Linked List creation: " + Benchmark.measure {
    while i <= n  do
        llist.add_to_tail(i.to_s)
        i +=1
    end
    
    
}.to_s

puts "Array fetch: " + Benchmark.measure { 
    array = (1..n).to_a

    array.fetch(4999)
}.to_s

puts "Linked List fetch: " + Benchmark.measure {
    while i <= n  do
        llist.add_to_tail(i.to_s)
        i +=1
    end
    
    llist.locate("5000").data
    
}.to_s

puts "Array delete: " + Benchmark.measure { 
    array = (1..n).to_a

    array.delete(4999)
}.to_s

puts "Linked List delete: " + Benchmark.measure {
    while i <= n  do
        llist.add_to_tail(i.to_s)
        i +=1
    end

    llist.delete("5000")
    
}.to_s

