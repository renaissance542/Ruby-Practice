# frozen_string_literal: true

require 'pry-byebug'

def palindrome(str)
  # if one or zero letters, return true
  return true if str.length < 2

  # if first and last letter identical, recurse inner part
  if str.end_with? str.chr 
     palindrome(str.slice(1, (str.size-2))) 
  else  # if first and last letter different return false
    return false
  end
end

puts "'abba' = #{palindrome('abba')}"
puts "'abcba' = #{palindrome('abcba')}"
puts "'crap' = #{palindrome('crap')}"
puts "'12vrrv21' = #{palindrome('12vrrv21')}"
puts "'a man, a plan, a canal, panama' = #{palindrome('a man, a plan, a canal, panama')}"

def bottles(n)
  if n == 0 
    puts 'no more bottles of beer on the wall'
    return
  end
  puts "#{n} bottles of beer on the wall"
  bottles(n-1)
end

# puts "\n12 Bottles!"
# puts "\n#{bottles(11)}"

# Define a recursive function that takes an argument n and 
# returns the fibonacci value of that position. 
# The fibonacci sequence is 0, 1, 1, 2, 3, 5, 8, 13, 21... 
# So fib(5) should return 5 and fib(6) should return 8.

def fibonacci(n)
  return 1 if n <= 2

  fibonacci(n-1) + fibonacci(n-2)
end

puts "\nFibonacci test:  fibonacci(6) = #{fibonacci(6)}"

# Define a recursive function that flattens an array.
# The method should convert [[1, 2], [3, 4]] to [1, 2, 3, 4] and
# [[1, [8, 9]], [3, 4]] to [1, 8, 9, 3, 4].

def flatten(arr)
  return arr unless arr.class == Array
  result = []
  arr.each { |i| result.push(flatten(i))}
  result
end

puts "\nFlattening [[1, 2], [3, 4]]"
puts flatten([[1, 2], [3, 4]])
puts "\nFlattening [[1, [8, 9]], [3, 4]]"
puts flatten([[1, [8, 9]], [3, 4]])



# Use the roman_mapping hash to define a recursive method
# that converts an integer to a Roman numeral.

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def int_to_rom(x)
  return '' if x == 0
  
  roman_mapping = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  number, letter = roman_mapping.find { |k, v| k <= x }
  letter + int_to_rom(x - number)
end

puts "\nint_to_rom(2153) = #{int_to_rom(2153)}"

def rom_to_int(str)
  return 0 if str.empty?

  roman_mapping = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  letter, number = roman_mapping.find { |letter, number| str.index(letter) == 0 }
  number + rom_to_int(str.delete_prefix(letter))
end

puts "\nrom_to_int('MCMLXXIX') = #{rom_to_int('MCMLXXIX')}"

