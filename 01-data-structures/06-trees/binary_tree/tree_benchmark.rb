require 'benchmark'
require_relative 'node'
require_relative 'binary_search_tree'
require_relative 'min_binary_heap'

n = 10000
i = 2

puts "Tree Creation: " + Benchmark.measure { 
    
    root = Node.new("Node"+1.to_s, 1)
    tree = BinarySearchTree.new(root)
    while i <= n do
        node = Node.new("Node"+i.to_s, i)
        tree.insert(root, node)
        i += 1
    end
    
}.to_s

puts "Heap creation: " + Benchmark.measure {
    heap = MinBinaryHeap.new
    node = Node.new("Node"+1.to_s, 1)
    heap.insert(node)
    while i <= n  do
        node = Node.new("Node"+i.to_s, i)
        heap.insert(node)
        i +=1
    end
    
    
}.to_s

puts "Tree fetch: " + Benchmark.measure { 
    root = Node.new("Node"+1.to_s, 1)
    tree = BinarySearchTree.new(root)
    while i <= n do
        node = Node.new("Node"+i.to_s, i)
        tree.insert(root, node)
        i += 1
    end

    tree.find(root, "Node5000")
    
}.to_s

puts "Heap fetch: " + Benchmark.measure {
    heap = MinBinaryHeap.new
    node = Node.new("Node"+1.to_s, 1)
    heap.insert(node)
    while i <= n  do
        node = Node.new("Node"+i.to_s, i)
        heap.insert(node)
        i +=1
    end
  
    
    heap.find("Node5000")
    
}.to_s

puts "Tree delete: " + Benchmark.measure { 
    root = Node.new("Node"+1.to_s, 1)
    tree = BinarySearchTree.new(root)
    while i <= n do
        node = Node.new("Node"+i.to_s, i)
        tree.insert(root, node)
        i += 1
    end
    tree.delete(root, "Node5000")
}.to_s

puts "Heap delete: " + Benchmark.measure {
    heap = MinBinaryHeap.new
    node = Node.new("Node"+1.to_s, 1)
    heap.insert(node)
    while i <= n  do
        node = Node.new("Node"+i.to_s, i)
        heap.insert(node)
        i +=1
    end
    heap.delete("Node5000")
    
}.to_s