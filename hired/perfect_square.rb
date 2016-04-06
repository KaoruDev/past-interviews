def solution(a, b)
  count = 0

  if a < 1
    base = 1
  else
    base = Math.sqrt(a).floor
  end

  if power_up(base) == a
    count += 1
    base +=1
  end

  while power_up(base) <= b
    count += 1
    base += 1
  end

  count
end

def power_up(base)
  base ** 2
end


puts "negative numbers should be 0, got: #{solution(-10, -1)}"
puts "range of -1, 4 should be 2, got: #{solution(-1, 4)}"
puts "range of 4, 17 should be 3, got: #{solution(4, 7)}"
