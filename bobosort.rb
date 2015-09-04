class Bobosort

  def initialize(a)
    @array = a
    @array.each { |i| print i.to_s+" "}
    puts
  end

  def sort()
      it = 0
      until ordered?
        @array.shuffle!
        it += 1
      end
      puts "Iterations: #{it}"
      puts @array
      puts
  end

  private

  def ordered?
    (0...@array.length-1).each do |i|
      if(@array[i+1] < @array[i])
        return false
      end
    end

    true
  end
end

size = 20
a = []
size.times do
  a << rand(1000)
end

bobo = Bobosort.new(a)
bobo.sort()
