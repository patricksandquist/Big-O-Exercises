require_relative "my_stack.rb"

class StackQueue

  def initialize
    @push_stack = MyStack.new
    @pop_stack = MyStack.new
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
end
