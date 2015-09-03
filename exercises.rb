def my_min1(array)
  array.each_with_index do |el, i|
    smallest = true
    array.each_with_index do |other, j|
      if el > other
        smallest = false unless i == j
      end
    end
    return el if smallest
  end
end

def my_min2(array)
  smallest = array[0]
  array.drop(1).each do |el|
    smallest = el if el < smallest
  end

  smallest
end

def largest_contiguous_subsum1(array)
  sub_arrays = []
  array.length.times do |i|
    (i...array.length).each do |j|
      sub_arrays << array[i..j]
    end
  end
  sums = []
  sub_arrays.each do |sub|
    sums << sub.inject(:+)
  end
  sums.max
end

def largest_contiguous_subsum2(array)
  maximum = nil
  array.length.times do |i|
    (i...array.length).each do |j|
      sum = array[i..j].inject(:+)
      if maximum.nil? || sum > maximum
        maximum = sum
      end
    end
  end

  maximum
end

def largest_contiguous_subsum3(array)
  best_sum = nil
  current_sum = 0
  length_of_current_sum = 0
  array.each_with_index do |el, idx|
    current_sum += el
    length_of_current_sum += 1

    if current_sum > current_sum - array[idx - length_of_current_sum + 1]
      current_sum -= array[idx - length_of_current_sum + 1]
    end

    if best_sum.nil? || current_sum > best_sum
      best_sum = current_sum
    end
  end
  best_sum
end

def largest_contiguous_subsum4(array)
  best_sum = nil
  current_sum = 0
  array.each_with_index do |el, idx|
    current_sum += el

    if current_sum < 0
      current_sum = 0
    end

    if best_sum.nil? || current_sum > best_sum
      best_sum = current_sum
    end
  end
  best_sum
end

def first_anagram(str_1, str_2)
  perms = []
  str_1.split("").permutation do |perm|
    perms << perm.join
  end
  perms.include?(str_2)
end

def second_anagram(string1, string2)
  string1.split("").each do |letter|
    return false unless string2.include?(letter)
  end

  true
end

def third_anagram(string1, string2)
  string1.split("").sort == string2.split("").sort
end

def fourth_anagram(string1, string2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  string1.length.times do |i|
    hash1[string1[i]] += 1
    hash1[string2[i]] += 1
  end

  hash1 == hash2
end

def fourth_anagram_bonus(string1, string2)
  hash = Hash.new { |h, k| h[k] = Array.new(2, 0) }
  string1.length.times do |i|
    hash[string1[i]][0] += 1
    hash[string2[i]][1] += 1
  end

  hash.values.all? { |arr| arr[0] == arr[1] }
end

def bad_two_sum?(array, target)
  array.length.times do |i|
    ((i + 1)...array.length).each do |j|
      return true if array[i] + array[j] == target
    end
  end
  false
end

def okay_two_sum?(array, target)
  array.sort! # n * ln(n)
  (1...array.length).each do |i| # n worst case
    back = array[-i]
    next if back > target
    (0...array.length - i).each do |j| # n worst case
      # break if j == array.length - i
      front = array[j]
      break if front + back > target
      return true if front + back == target
    end
  end

  false
end

def okay_two_sum2?(array, target)
  array.sort! # n * ln(n)
  i = 0
  j = array.length - 1
  while i < j
    return true if array[i] + array[j] == target
    if array[i] + array[j] > target
      j -= 1
    else
      i += 1
    end
  end

  false
end

def best_two_sum?(array, target)
  hash = Hash.new { |h,k| h[k] = Array.new(2,0) }
  array.each_with_index do |el, idx|
    key = target - el
    hash[key] = [el, idx]
  end

  array.each_with_index do |el, idx|
    return true if hash.include?(el) && hash[el] != [el, idx]
  end

  false
end
