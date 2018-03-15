class MaxBinaryHeap
	attr_accessor :items
	attr_accessor :items_maps

  def initialize
    @items = []
	@items_map = Hash.new
  end

  def insert(node)
	@items << node
	@items_map[node] = @items.size - 1
	shift_up(@items.size - 1)
  end

  def array
	ary = []		
	@items.each do |item|
		ary.push(item)
	end
	ary
  end
	

	private

	def shift_up(index)
		parent_index = index/2
		return if @items[index] <= @items[parent_index]
		exchange(index, parent_index)
		shift_up(parent_index)
	end

	def shift_down(index)
		child_index = index*2
		last_index = @items.size - 1
		return if child_index < last_index
		left_item = @items[child_index]
		if @items[child_index + 1].nil?
			right_item = 0
		else
			right_item = @items[child_index + 1]
		end
		is_last_index = child_index == last_index
		child_index += 1 if !is_last_index && right_item > left_item
		return if @items[index] >= @items[child_index]
		exchange(index, child_index)
		shift_down(child_index)
	end	

	def exchange(source, target)
		tmp_source = @items[source]
		tmp_target = @items[target]
		source_map = @items_map[tmp_source]
		target_map = @items_map[tmp_target]

		@items[source] = tmp_target
		@items[target] = tmp_source
		@items_map[tmp_source] = target_map
		@items_map[tmp_target] = source_map
	end
end




