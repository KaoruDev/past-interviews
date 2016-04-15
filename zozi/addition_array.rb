test_one = [4, 5, 9]
test_two = [1, 2, 3, 24]
test_three = [1, 4, 3, 8, 7, 2]
test_four = [1, 3, 4, 7, 2]

def addition(numbers)
  max = numbers.max
  numbers.delete(max)

  build_combinations(numbers) do |combo|
    combo.reduce(&:+) == max
  end
end

def build_combinations(rest)

  false
end

puts "test_one: #{test_one} returns \"#{addition(test_one)}\", expect it to be true"
#puts "test_two: #{test_two} returns \"#{addition(test_two)}\", expect it to be false"
#puts "test_three: #{test_three} returns \"#{addition(test_three)}\", expect it to be true"
#puts "test_four: #{test_four} returns \"#{addition(test_four)}\", expect it to be true"
