require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root

    if current_node.rating > node.rating 
      if current_node.left == nil
        current_node.left = node
        return current_node.left
      else
        current_node = current_node.left
        self.insert(current_node, node)
      end
    end
    if current_node.rating < node.rating 
      if current_node.right == nil
        current_node.right = node
        return current_node.right
      else
        current_node = current_node.right
        self.insert(current_node, node)
      end
    end

  end

  # Recursive Depth First Search
  def find(root, data)
    current_node = root
    if current_node.title == data
      return current_node
    elsif current_node.left != nil
      find(current_node.left, data)
    elsif current_node.right != nil
      find(current_node.right, data)
    end

  end

  def find_min(root)
    while root.left
      root = root.left
    end
    root
  end

  def delete(root, data)
    return unless root && data
    goner = self.find(root, data) 
    return if goner.nil?
    if goner.rating < root.rating
      root.left = delete(root.left, data)
    elsif goner.rating > root.rating
      root.right = delete(root.right, data)
    else
      if root.left.nil? && root.right.nil?
        root = nil
      elsif root.left.nil?
        root = root.right
      elsif root.right.nil?
        root = root.left
      else
        temp = find_min(root.right)
        root = temp
        root.right = delete(root.right, temp.title)
      end
    end
    root
  end

  # Recursive Breadth First Search
  def printf(children=nil)

    new_children = []
    
    if children == nil
      children = [@root.left, @root.right]
      puts @root.title.to_s + ": " + @root.rating.to_s
    end

    children.each do |ch|
      if ch != nil
        puts ch.title.to_s + ": " + ch.rating.to_s
        new_children.push(ch.left) if ch.left
        new_children.push(ch.right) if ch.right
      end
    end

    if new_children != []
       printf(new_children)
    end
  end
end
