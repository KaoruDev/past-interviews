def staircase(n, original_n = nil)
  return if n <= 0
  original_n ||= n
  n -= 1
  puts (" " * n) + ("#" * (original_n - n))
  staircase(n, original_n)
end

_n = Integer(gets)
staircase(_n)
