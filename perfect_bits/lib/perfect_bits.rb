require_relative "./perfect_square_generator"
require_relative "./bit_math"

class PerfectBits

  def self.count_range(start, finish)
    count = 0
    bits = self.new(start, finish)
    bits.run_bits do |bit|
      count += bit.count
    end
    count
  end

  attr_reader :count

  def initialize(start, finish)
    @start = start
    @finish = finish
    @count = 0
    @base = 1
  end

  def run_bits
    bit = BitMath.new(@start, @finish, generator.square)
    bit.calculate
    yield(bit)

    while @finish > generator.next_limit
      generator.power_up!
      bit = BitMath.new(@start, @finish, generator.square)
      bit.calculate
      yield(bit)
    end
  end

  def generator
    @generator ||= PerfectSquareGenerator.new
  end

end

