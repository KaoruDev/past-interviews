require_relative "./pascal"

class BitMath
  include Pascal
  attr_reader :count

  def initialize(start, finish, square)
    @start = start
    @finish = finish
    @square = square
    @square_diff = square - 2
    @power = 0
    @count = 0
  end

  def calculate
    calculate_low
    calculate_range
    calculate_high
  end

  def calculate_low
    @power = log_2(@start)
    difference = @start - power_of(@power)
    @count -= calculate_difference_in_power(difference)
  end

  def calculate_range
    while is_in_range?(power_of(@power + 1))
      @count += find_in_pascal_triangle(@power - @square_diff, @square_diff)
      @power += 1
    end
  end

  def calculate_high
    @power = log_2(@finish)
    difference = @finish - power_of(@power) + 1

    if difference == 0 && @square == 1
      @count += 1
    else
      @count += calculate_difference_in_power(difference)
    end
  end

  def calculate_difference_in_power(difference)
    start = -1
    powers = find_powers(difference)

    result = powers.first(@square - 1).inject(0) do |sum, power|
      start += 1
      find_in_pascal_triangle(power - @square_diff + start, @square_diff - start) + sum
    end

    result += 1 if powers.count > @square - 1
    result
  end

  def find_in_pascal_triangle(power, level = 1)
    triangle(power + level)[level + 1].to_i
  end

  def find_powers(number, result=[])
    if number == 1
      result << 0
      return result
    end

    return result if number <= 0

    result << (Math.log(number) / Math.log(2)).floor

    find_powers(number - power_of(result.last), result)
  end

  def power_of(power)
    power ||= @power
    2 ** power
  end

  def is_in_range?(number)
    (@start..@finish).cover?(number)
  end

  def log_2(number)
    result = (Math.log(number) / Math.log(2))
    result < 0 ? 0 : result.floor
  end
end

