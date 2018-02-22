require_relative 'node'
require_relative 'binary_search_tree'
require_relative 'min_binary_heap'

i = 2
n = 10

heap = MinBinaryHeap.new
node = Node.new("Node"+1.to_s, 1)
heap.insert(node)
while i <= n  do
    node = Node.new("Node"+i.to_s, i)
    heap.insert(node)
    i +=1
end

ham = heap.find("Node5")
puts "ham: "+ham.title

heap.delete("Node5")

heap.print
puts "where's "+ham.title+"?"