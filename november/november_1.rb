# Add Two Numbers
 
# You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order, 
# and each of their nodes contains a single digit. 
# Add the two numbers and return the sum as a linked list.

# You may assume the two numbers do not contain any leading zero, 
# except the number 0 itself.

 

# Example 1:

# 2->4->3
# 5->6->4
# =
# 7->0->8

# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

# Example 2:

# Input: l1 = [0], l2 = [0]
# Output: [0]

# Example 3:

# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]
 

# Constraints:

# The number of nodes in each linked list is in the range [1, 100].
# 0 <= Node.val <= 9
# It is guaranteed that the list represents a number that does not have leading zeros.

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

l_1 = [2,4,3]
l_2 = [5,6,4]

# def add_two_numbers(l1, l2)
#   sum_1 = 0
#   sum_2 = 0

#   right_l1 = l1.length - 1
#   right_l2 = l2.length - 1

#   while right_l1 > -1 
#     sum_1 += l1[right_l1]
#     right_l1 -= 1
#   end

#   while right_l2 > -1
#     sum_2 += l2[right_l2]
#     right_l2 -= 1
#   end

#   sum_1
# end

# Working array solution:

# def add_two_numbers(l1, l2)
#   l1.map! do |digit|
#     digit.to_s
#   end
#   integer_1 = l1.join('').reverse.to_i
  
#   l2.map! do |digit|
#     digit.to_s
#   end
#   integer_2 = l2.join('').reverse.to_i
#   sum = integer_1 + integer_2
#   backwards_arr = sum.to_s.split('').reverse
#   backwards_arr.map! do |num|
#     num.to_i
#   end
#   backwards_arr
# end



p add_two_numbers(l_1, l_2)