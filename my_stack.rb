class MyStack
  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    element = @store.pop
    if element[0] == @max
      @max = element[1]
    elsif element[0] == @min
      @min = element[1]
    end

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
