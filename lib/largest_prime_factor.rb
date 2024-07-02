# frozen_string_literal: true

# The prime factors of 13195 are 5, 7, 13, 29
# What is the largest prime factor of the number 600851475143

require 'prime'

# non-recursive solution for finding the largest prime factor
def largest_prime_factor_non_rec(num, factor = 1)
  sqrt = Integer.sqrt(num)
  Prime.each(num) do |prime|
    return factor if prime >= sqrt

    factor = prime if (num % prime).zero?
  end
end

# recursive solution
def largest_prime_factor(num, factor = 2)
  return factor if num == 1

  # use prime class to find all the numbers up to num that is prime
  # set factor = prime only if num is divisible by prime
  # then divide num by the factor found and use that in the next call of largest_prime_factor
  Prime.find(num) { |prime| factor = prime if (num % prime).zero? }
  largest_prime_factor(num / factor, factor)
end

# solution found online that was used to help create my solution
def large_prime(num)
  return [] if num == 1

  factor = (2..num).find { |x| (num % x).zero? }
  # gets the first factor of num that is divisible
  # next recursive call sets num to num divided by that found factor
  [factor] + large_prime(num / factor)
end

puts largest_prime_factor(600_851_475_143) # => 6,857
puts largest_prime_factor(13_195) # => 29

# puts large_prime(600_851_475_143)
