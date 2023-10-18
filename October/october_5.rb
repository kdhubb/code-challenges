# # Given a string containing digits from 2-9 inclusive, 
# return all possible letter combinations that the number could represent. 
# Return the answer in any order.

# A mapping of digits to letters (just like on the telephone buttons) is given below. 
# Note that 1 does not map to any letters.


 

# Example 1:

# Input: digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
# Example 2:

# Input: digits = ""
# Output: []

# Example 3:

# Input: digits = "2"
# Output: ["a","b","c"]
 

# Constraints:

# 0 <= digits.length <= 4
# digits[i] is a digit in the range ['2', '9'].

# Pseudocode: 
# setup values for each digit, e.g. "2" = [a, b, c]
# count length of digits

# separate letters into array
# find all combinations possible matching length of original digits
# will .uniq be needed? not sure if repeating values will be given for repeating digits. 

digits = "2"
# digits = "23"
# digits = ""
# digits = "232"


def letter_combinations(nums)
  length = nums.length
  digits = nums.split("")
  digits.each do |digit|
    digit.gsub!("2", "abc")
    digit.gsub!("3", "def")
    digit.gsub!("4", "ghi")
    digit.gsub!("5", "jkl")
    digit.gsub!("6", "mno")
    digit.gsub!("7", "pqrs")
    digit.gsub!("8", "tuv")
    digit.gsub!("9", "wxyz")
  end
  if nums == ""
    []
  else
    digits.map! do |digit|
      digit.split("")
    end
    if length == 1 
      return digits.flatten
    elsif length == 2
      combos = digits.first.product(digits[1])
    elsif length == 3
      combos = digits.first.product(digits[1], digits[2])
    elsif length == 4
      combos = digits.first.product(digits[1], digits[2], digits[3])
    end  
    if length > 1 
      combos.map! do |combo|
        combo.join("")
      end
      return combos
    end
  end
end

p letter_combinations(digits)