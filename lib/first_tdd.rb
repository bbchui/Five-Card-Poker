class Array

  def my_uniq
    arr = []
    self.each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end

  def two_sum
    arr = []
    self.each_index do |i|
      self.each_index do |j|
        arr << [i, j] if self[i] + self[j] == 0 && i < j
      end
    end
    arr
  end

  def my_transpose
    return [] if self.empty?
    arr = []
    self[0].length.times do |i|
      arr2 = []
      self.each_index do |row|
        arr2 << self[row][i]
      end
      arr << arr2
    end
    arr
  end

  def stock_picker
    arr = []
    biggest_difference = 0
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        difference = self[j] - self[i]
        if difference > biggest_difference
          biggest_difference = difference
          arr = [i, j]
        end
        j += 1
      end
      i += 1
    end
    arr
  end
end
