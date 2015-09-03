# require_relative 'my_stack.rb'

def max_windowed1(array, width) # n^2
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
