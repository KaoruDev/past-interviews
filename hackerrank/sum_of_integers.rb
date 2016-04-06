def sumOfIntegers(arr)
  arr.split(/\s+/)[1..-1].reduce(0) { |sum, num|
    sum + num.to_i
  }
end

result = sumOfIntegers(%q{5
                       1
                       2
                       3
                       4
                       5})

puts "expect #{result} to be 15"
