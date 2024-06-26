# @param {String} s
# @return {Integer}
# challenge: https://leetcode.com/problems/longest-substring-without-repeating-characters/

require 'minitest/autorun'
require 'timeout'

class LongestSubstringWithouRepeatingChars
  def initialize(string)
    @string = string
  end

  def length_of_longest_substring

    max_length = 0
    start_index = 0
    char_index_hash = {}
    
    #Use a hash to store the index of each character, allowing O(1) access to check if the character has already appeared and update its index
    
    @string.chars.each_with_index do |char, current_index|
      if char_index_hash.key?(char) && char_index_hash[char] >= start_index
        start_index = char_index_hash[char] + 1
      end

      char_index_hash[char] = current_index
      max_length = [max_length, current_index - start_index + 1].max
    end
    
    max_length
  end
end

class LongestSubstringWithouRepeatingCharsTests < Minitest::Test
  def test_scenario_one
    string = LongestSubstringWithouRepeatingChars.new("abcabcbb")
    assert_equal 3, string.length_of_longest_substring
  end

  def test_scenario_two
    string = LongestSubstringWithouRepeatingChars.new("bbbbb")
    assert_equal 1, string.length_of_longest_substring
  end

  def test_scenario_three
    string = LongestSubstringWithouRepeatingChars.new("pwwkew")

    result = Timeout.timeout(1.0) { string.length_of_longest_substring }
    assert_equal 3, result
  end
end