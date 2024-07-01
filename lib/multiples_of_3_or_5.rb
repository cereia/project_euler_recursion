# frozen_string_literal: true

# Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_multiples(num, sum = 0)
  # because the multiples have to be less than the given number, do the decrement first
  num -= 1
  if num < 3
    return sum
  elsif (num % 5).zero? || (num % 3).zero?
    sum += num
  end

  sum_of_multiples(num, sum)
end

puts sum_of_multiples(10) # => 3, 5, 6, 9 = 23
puts sum_of_multiples(1000) # => 233168
