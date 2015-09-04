require_relative 'my_stack.rb'

class MinMaxStackQueue
  def initialize
    @push_stack = MyStack.new
    @pop_stack = MyStack.new
    @min = nil
    @max = nil
  end

  def enqueue(value)
    @push_stack.push(value)
  end

  def dequeue
    if @pop_stack.size == 0
      until @push_stack.size == 0
        @pop_stack.push(@push_stack.pop)
      end
    end

    @pop_stack.pop
  end

  def peek
    value = @pop_stack.pop
    @pop_stack.push(value)
    value
  end

  def size
    @pop_stack.size + @push_stack.size
  end

  def min
    nums = []
    nums << @pop_stack.min unless @pop_stack.min.nil?
    nums << @push_stack.min unless @push_stack.min.nil?
    nums.min
  end

  def max
    nums = []
    nums << @pop_stack.max unless @pop_stack.max.nil?
    nums << @push_stack.max unless @push_stack.max.nil?
    nums.max
  end
end
