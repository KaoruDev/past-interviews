require 'pry'

class AreSumsEqual

  def initialize(configs={})
    @set = configs[:set]
    @index = configs[:index]
  end

  def solve
    sum_elements_left_of_index == sum_elements_right_of_index
  end

  private

  def sum_elements_left_of_index
    sum(@set[0...@index])
  end

  def sum_elements_right_of_index
    sum(@set[(@index + 1)..-1])
  end

  def sum(sectioned_set)
    sectioned_set.reduce(:+)
  end

end

class FindPivot

  class << self
    def find(set)
      indexes = []
      # Loop through array exluding last elements, which will naturally skip over arrays with length < 3
      set[1...-1].each_with_index do |_, index|
        # increase index because we are starting on the 1st element
        index += 1

        indexes << index if AreSumsEqual.new({set: set, index: index}).solve
      end

      indexes.empty? ? -1 : indexes.uniq
    end

  end
end

puts "#{FindPivot.find([1, 2, 1])} should return 1"

puts "#{FindPivot.find([1, 2])} should return -1"

puts "#{FindPivot.find([1, 4, 6, 3, 2])} should return 2"

puts "#{FindPivot.find([1, 3, 2, 3, 2])} should return -1"

puts "#{FindPivot.find([1, 4, 3, 2])} should return -1"

puts "#{FindPivot.find([1, 4, 6, 2])} should return -1"

puts "#{FindPivot.find([1, 4, 2, 3, 5, 2])} should return 3"

puts "#{FindPivot.find([1, 1, 2, 1, 4])} should return 3"

puts "#{FindPivot.find([1, 5, 2, 2, 2, 4])} should return -1"

puts "#{FindPivot.find([6, 0, 0, 0, 6])} should return [1, 2, 3]"


