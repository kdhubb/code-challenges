# You are given an integer array height of length n. 
# There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) 
# and (i, height[i]).

# Find two lines that together with the x-axis form a container, 
# such that the container contains the most water.

# Return the maximum amount of water a container can store.

# Notice that you may not slant the container.

# https://leetcode.com/problems/container-with-most-water/

# Example 1:


# Input: height = [1,8,6,2,5,4,8,3,7]
# Output: 49
# Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. 
# In this case, the max area of water (blue section) the container can contain is 49.
# Example 2:

# Input: height = [1,1]
# Output: 1
 

# Constraints:

# n == height.length
# 2 <= n <= 105
# 0 <= height[i] <= 104

# heights = [1,8,6,2,5,4,8,3,7]
heights = [1,1]

def max_area(height)
  heights = Hash.new([])
  height.each_with_index do |num, index|
    heights[num] += [index]
  end
  volume = []
  if heights.keys.length > 1
    heights.keys.combination(2) do |combo|
      max_idx_combo = []
      heights[combo[0]].each do |idx1|
        heights[combo[1]].each do |idx2|
          max_idx_combo << (idx2 - idx1)
        end
      end
    volume << (combo.min * max_idx_combo.max)
    end
    volume.max
  else
    heights.keys[0] * (heights[heights.keys[0]].length - 1)
  end
end

p max_area(heights)