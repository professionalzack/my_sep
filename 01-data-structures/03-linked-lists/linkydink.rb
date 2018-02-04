require_relative 'node'
require_relative 'linked_list'

n = 20
llist = LinkedList.new
i = 1




while i <= n  do
   llist.add_to_tail(i.to_s)
   i +=1
end


 llist.delete("10")

 p llist


