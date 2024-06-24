# challenge: https://leetcode.com/problems/roman-to-integer
# @param {String} number_to_convert
# @return {Integer}

require 'minitest/autorun'
require 'timeout'

class RomanToInteger
  def initialize(number_to_convert)
    @number_to_convert = number_to_convert
  end

  def roman_to_int
    roman_numbers = {"I" => 1,"V" => 5,"X" => 10,"L" => 50,"C"=> 100,"D" => 500,"M" => 1000}
    roman_substractions = {"IV" => 4,"IX" => 9,"XL" => 40,"XC" => 90,"CD" => 400,"CM" => 900}
    
    number = 0
    result = 0
    
    while number < @number_to_convert.length
      value = if (current = roman_substractions[@number_to_convert[number..(number+1)]])
        number += 1
        current
      else
        roman_numbers[@number_to_convert[number]]
      end
    
      result += value
      number += 1
    end
    
    result
  end
end

class RomanToIntegerTests < Minitest::Test
  def test_scenario_one
    roman = RomanToInteger.new("MCMXCIV")
    assert_equal 1994, roman.roman_to_int
  end

  def test_scenario_two
    roman = RomanToInteger.new("III")
    assert_equal 3, roman.roman_to_int
  end

  def test_scenario_three
    roman = RomanToInteger.new("LVIII")

    result = Timeout.timeout(1.0) { roman.roman_to_int }
    assert_equal 58, result
  end
end