$:.unshift File.expand_path(Dir.pwd, '..')

require "lib/mama_prime"
require "lib/prime_multiplication_table"

number_of_primes = ARGV[0]

primes = MamaPrime.new.birth(number_of_primes.to_i)

table = PrimeMultiplicationTable.new
table.generate(primes)
table.print_table

