# Two Sum

# Given an array of integers nums and an integer target, 
# return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, 
# and you may not use the same element twice.

# You can return the answer in any order.

 

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
# Example 2:

# Input: nums = [3,2,4], target = 6
# Output: [1,2]
# Example 3:

# Input: nums = [3,3], target = 6
# Output: [0,1]
 

# Constraints:

# 2 <= nums.length <= 104
# -109 <= nums[i] <= 109
# -109 <= target <= 109
# Only one valid answer exists.
 

# Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
numbers = [3, 2, 4, 2]
targett = 6

# def two_sums(nums, target)
#   combos = nums.combination(2).to_a
#   answer = []
#   combos.each do |combo|
#     if combo[0] + combo[1] == target
#       answer << combo
#       break
#     end
#   end
#   indices = []
#   answer.flatten!
#   answer.each do |num|
#     indices << nums.index(num)
#   end
#   indices
# end

def two_sums(nums, target)
  num_hash = Hash.new([])
  index = 0
  nums.each do |num|
    num_hash["#{num}"] += [index]
    index +=1
  end
  indices = []
  nums.combination(2) do |combo|
    if combo[0] + combo[1] == target
      indices << num_hash[combo[0].to_s].shift
      indices << num_hash[combo[1].to_s].shift
      break
    end
  end
  indices
end

p two_sums(numbers, targett)