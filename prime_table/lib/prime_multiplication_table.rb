class PrimeMultiplicationTable

  def generate(prime_numbers=[])
    prime_numbers.unshift(0)

    @table = prime_numbers[1..-1].inject([prime_numbers]) do |result, prime|
      result << build_row(prime, prime_numbers[1..-1])
      result
    end
  end

  def print_table
    @table.each do |row|
      row.each do |product|
        print pad(product)
      end

      print "\n"
    end
  end

  private

  def build_row(prime, prime_numbers)
    prime_numbers.inject([prime]) do |row, row_prime|
      product = prime * row_prime
      log_largest(product)
      row << product
      row
    end
  end

  def log_largest(product)
    @largest_product = product > @largest_product.to_i ? product : @largest_product
  end

  def product_length(product)
    product.to_s.length
  end

  def pad(target)
    diff = product_length(@largest_product) - product_length(target)

    if diff == 0
      "\s#{target}\s"
    else
      "\s#{create_spaces(diff)}#{target}\s"
    end
  end

  def create_spaces(number)
    number.times.map do
      "\s"
    end.join
  end

end
