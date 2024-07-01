# frozen_string_literal: true

# By considering the terms in the Fibonacci sequence whose values do not exceed four million,
# find the sum of the even-valued terms.

def even_fibs_sum(num, fibs = [0, 1], sum = 0)
  # value is the next fibonacci number
  value = fibs[0] + fibs[1]
  # return the sum when the next number in the sequence is greater than 4,000,000
  return sum if value > num

  # push value into the fibs array and remove the first number so it's a 2 number array
  fibs << value
  fibs.shift
  # if value is an even number, it gets added to the sum
  sum += value if value.even?
  # recursive call where fibs array has changed
  even_fibs_sum(num, fibs, sum)
end

puts even_fibs_sum(4_000_000) # => 4613732
