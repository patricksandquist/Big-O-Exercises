class MyStack
  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    element = @store.pop
    @max = element[1] if element[0] == @max
    @min = element[1] if element[0] == @min

    element[0]
  end

  def push(value)
    if @max.nil? || value > @max
      element = [value, @max]
      @max = value
    end
    if @min.nil? || value < @min
      element = [value, @min]
      @min = value
    end

    element = [value, nil] if value < @max && value > @min

    @store.push(element)
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end
end
