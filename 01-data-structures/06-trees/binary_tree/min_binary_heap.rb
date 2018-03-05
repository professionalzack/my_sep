require_relative 'node'

class MinBinaryHeap
	attr_accessor :items
	attr_accessor :items_maps

  def initialize
    @items = []
	@items_map = Hash.new
  end

  def insert(node)
		@items << node
		@items_map[node.title] = @items.size - 1
		shift_up(@items.size - 1)
  end

  def delete(data)
		return if data.nil?
		item_position = @items_map[data]
		unless item_position.nil?
			exchange(item_position, @items.size - 1)
			item_to_remove = @items.pop
			@items_map.delete(item_to_remove.title)
			shift_down(item_position)
			return item_to_remove
		end	
	end

	def find(data)
		return if data.nil?
		item_position = @items_map[data]
		return if item_position.nil?
		return @items[item_position]
	end
	
	def print		
		@items.each do |item|
			puts item.title.to_s+": "+item.rating.to_s
		end
	end

	private

	def shift_up(index)
		parent_index = index/2
		return if @items[index].rating >= @items[parent_index].rating
		exchange(index, parent_index)
		shift_up(parent_index)
	end

	def shift_down(index)
		child_index = index*2
		last_index = @items.size - 1
		return if child_index > last_index
		left_item = @items[child_index].rating
		if @items[child_index + 1].nil?
			right_item = 0
		else
			right_item = @items[child_index + 1].rating
		end
		is_last_index = child_index == last_index
		child_index += 1 if !is_last_index && right_item < left_item
		return if @items[index].rating <= @items[child_index].rating
		exchange(index, child_index)
		shift_down(child_index)
	end	

	def exchange(source, target)
		tmp_source = @items[source]
		tmp_target = @items[target]
		source_map = @items_map[tmp_source.title]
		target_map = @items_map[tmp_target.title]

		@items[source] = tmp_target
		@items[target] = tmp_source
		@items_map[tmp_source.title] = target_map
		@items_map[tmp_target.title] = source_map
	end
end