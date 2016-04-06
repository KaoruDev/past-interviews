class PerfectSquareGenerator
  def initialize(base=1)
    @base = base
  end

  def power_up!
    @base += 1 if @base < 1
    @base += 1
  end

  def square
    return 1 if at_beginning?
    @base ** 2
  end

  def next_limit
    2 ** (next_square - 1)
  end

  def limit(offset = 0)
    2 ** (square - 1 + offset)
  end

  def previous_square
    incr = at_beginning? ? 0 : 1
    (@base - incr) ** 2
  end

  def next_square
    incr = at_beginning? ? 2 : 1
    (@base + incr) ** 2
  end

  def at_beginning?
    @base < 1
  end
end

