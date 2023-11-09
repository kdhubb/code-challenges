# Longest Common Prefix


# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

 

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"
# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.
 

# Constraints:

# 1 <= strs.length <= 200
# 0 <= strs[i].length <= 200
# strs[i] consists of only lowercase English letters.

strs_1 = ["dog","racecar","car"]
strs_2 = ["flower","flow","flight"]
strs_3 = ["flower","flower","flower","flower"]

def longest_common_prefix(strings)
  left = 1
  
  common_letters = []

  common_letters << strings.first.split("")

  common_letters.flatten!

  until common_letters.length == 0 || left == strings.length
    if common_letters == strings[left].split("")
      left += 1
    else
      left_char = 0
      char_arr = strings[left].split("")
      until char_arr[left_char] != common_letters[left_char]
        left_char += 1 
      end
      common_letters.slice!(left_char..(common_letters.length - 1))
      left += 1
    end
  end
  common_letters.join("")
end

p longest_common_prefix(strs_3)