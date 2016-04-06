class MamaPrime
  FIRST_PRIME = 2

  def initialize(marker = nil)
    @marker = marker || FIRST_PRIME
  end

  def birth(number_of_prime_numbers = 0)
    result = []
    length = 0

    while length != number_of_prime_numbers
      result << find_next_prime
      length = length + 1
    end

    result
  end

  #private

  def find_next_prime
    number = @marker

    if number < 4
      move_marker_forward
      return number
    elsif is_marker_divisible_by?(2) || is_marker_divisible_by?(3)
      move_marker_forward
      return find_next_prime
    elsif is_marker_square_less_than?(5, number)
      return exponentially_find_next_prime(5)
    end

    move_marker_forward
    number
  end

  def exponentially_find_next_prime(exponential_marker)
    number = @marker

    if is_marker_square_less_than?(exponential_marker, number)
      if is_marker_divisible_by?(exponential_marker) || is_marker_divisible_by?(exponential_marker + 2)
        move_marker_forward
        return find_next_prime
      else
        return exponentially_find_next_prime(exponential_marker + 6)
      end
    else
      move_marker_forward
      return number
    end
  end

  def is_marker_square_less_than?(marker, number)
    marker * marker <= number
  end

  def is_marker_divisible_by?(divisor)
    @marker % divisor == 0
  end

  def move_marker_forward
    @marker = @marker + 1
  end

end
