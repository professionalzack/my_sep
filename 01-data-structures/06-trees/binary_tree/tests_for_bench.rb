require_relative 'node'
require_relative 'binary_search_tree'
require_relative 'min_binary_heap'

n = 10
i = 2


    
root = Node.new("Node"+1.to_s, 1)
tree = BinarySearchTree.new(root)
while i <= n do
    node = Node.new("Node"+i.to_s, i)
    tree.insert(root, node)
    i += 1
end

ham = tree.find(root, "Node5")
puts "goodness it's " + ham.to_s + "~("+ham.title+")~"

 tree.delete(root, "Node5")
    
tree.printf

puts "and where is "+ham.title+" now??"
