require_relative 'min_max_stack_queue.rb'

def windowed_max_range1(array, width) # n^2
  current_max_range = nil
  (0..array.length - width).each do |i|
    max = array[i...i + width].max
    min = array[i...i + width].min
    if current_max_range.nil? || current_max_range < max - min
      current_max_range = max - min
    end
  end

  current_max_range
end


def windowed_max_range2(array, width)
  current_max_range = nil
  q = MinMaxStackQueue.new
  width.times do
    q.enqueue(array.shift)
  end

  while true
    local_max_range = (q.max - q.min)
    if current_max_range.nil? || local_max_range > current_max_range
      current_max_range = local_max_range
    end
    break if array.empty?
    q.dequeue
    q.enqueue(array.shift)
  end

  current_max_range
end
