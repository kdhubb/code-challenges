# --- Day 3: Gear Ratios ---
# You and the Elf eventually reach a gondola lift station; 
# he says the gondola lift will take you up to the water source,
# but this is as far as he can bring you. You go inside.

# It doesn't take long to find the gondolas, 
# but there seems to be a problem: they're not moving.

# "Aaah!"

# You turn around to see a slightly-greasy Elf with a wrench 
# and a look of surprise. "Sorry, I wasn't expecting anyone! 
# The gondola lift isn't working right now; it'll still 
# be a while before I can fix it." You offer to help.

# The engineer explains that an engine part seems to be missing 
# from the engine, but nobody can figure out which one. 
# If you can add up all the part numbers in the engine schematic, 
# it should be easy to work out which part is missing.

# The engine schematic (your puzzle input) consists of a 
# visual representation of the engine. There are lots of numbers 
# and symbols you don't really understand, 
# but apparently any number adjacent to a symbol, 
# even diagonally, is a "part number" and should be 
# included in your sum. (Periods (.) do not count as a symbol.)

# Here is an example engine schematic:

# 467..114..
# ...*......
# ..35..633.
# ......#...
# 617*......
# .....+.58.
# ..592.....
# ......755.
# ...$.*....
# .664.598..

# In this schematic, two numbers are not part numbers because 
# they are not adjacent to a symbol: 114 (top right) and 58 
# (middle right). Every other number is adjacent to a symbol 
# and so is a part number; their sum is 4361.

# Of course, the actual engine schematic is much larger. 
# What is the sum of all of the part numbers in the 
# engine schematic?

# ?? symbols include: !@#$%^&*()?+=_-~`":;/><,\|[]{}`
# if line 4 has a symbol at index five
# and line 5 has a number at indeces 4, 5, and six,
# is that considered adjacent?


# Map each line to an array
# Record index positions of symbols for previous, current and next line
# Record index positions of numbers in current line.
# See if numbers are in adjacent index positions to symbols
# If yes, then add to sum
# Maybe use recursion here

# def schematic_sum(text_file)
#   previous_line = []
#   current_line = []
#   next_line = []
#   sum = 0
#   line_num = 1
#   until line_num >= 2
#     File.foreach(text_file) do |line|
#       sym_index = 0
#       line_read = []
#       line.each_char do |char|
#         if !/[0123456789.]/.match(char)
#           line_read << sym_index
#         end
#         sym_index += 1
#       end
#       previous_line = current_line
#       current_line = next_line
#       next_line = line_read
#       line_num += 1
#     end
#   end 
#   File.foreach(text_file) do |line|
#     sym_index = 0
#     line_read = []
#     line.each_char do |char|
#       if !/[0123456789.]/.match(char)
#         line_read << sym_index
#       end
#       sym_index += 1
#     end
#     previous_line = current_line
#     current_line = next_line
#     next_line = line_read

#     num_index = 0
#     num_indices = []
#     line.each_char do |char|
#       if /[0123456789]/.match(char)
#         num_indices << num_index
#       end
#       num_index += 1
#     end
#     num_indices.select! do |index|
#       previous_line.include?(index) || previous_line.include?(index + 1) || previous_line.include?(index - 1) ||
#       current_line.include?(index + 1) || current_line.include?(index - 1) ||
#       next_line.include?(index) || next_line.include?(index + 1) || next_line.include?(index - 1)
#     end
#     char_arr = line.split("")
#     nums = []
#     curr_index = 0
#     p num_indices
#     p char_arr
#     num_indices.each do |num_index|
#       nums << char_arr[num_index]
#       if num_indices[curr_index + 1] != num_index + 1
#         num = nums.join("").to_i
#         p num
#         sum += num
#         p sum
#         nums.clear
#       end
#       curr_index += 1
#     end
#   end
#   sum
# end

def schematic_sum(text_file)
  total_lines = 0
  current_line = 0
  previous_line = -1
  next_line = 1
  File.foreach(text_file) do |line|
    total_lines += 1
  end
  until next_line >= total_lines
    curr_str = IO.readlines(text_file)[current_line]
    prev_str = IO.readlines(text_file)[current_line - 1]
    next_str = IO.readlines(text_file)[current_line + 1]

    p curr_str
    sym_index = 0
    curr_line_syms = []
    curr_str.chop.each_char do |char|
      if  !/[0123456789.]/.match(char)
        curr_line_syms << sym_index
      end
      sym_index += 1
    end

    sym_index = 0
    prev_line_syms = []
    prev_str.chop.each_char do |char|
      if  !/[0123456789.]/.match(char)
        prev_line_syms << sym_index
      end
      sym_index += 1
    end

    sym_index = 0
    next_line_syms = []
    next_str.chop.each_char do |char|
      if  !/[0123456789.]/.match(char)
        next_line_syms << sym_index
      end
      sym_index += 1
    end

    num_index = 0
    curr_line_nums = []
    curr_str.chop.each_char do |char|
      if /[0123456789]/.match(char)
        curr_line_nums << num_index
      end
      num_index += 1
    end

    curr_line_nums.select! do |index|
      prev_line_syms.include?(index) || prev_line_syms.include?(index + 1) || prev_line_syms.include?(index - 1) ||
      curr_line_syms.include?(index + 1) || curr_line_syms.include?(index - 1) ||
      next_line_syms.include?(index) || next_line_syms.include?(index + 1) || next_line_syms.include?(index - 1)
    end
    
    p curr_line_nums

    current_line += 1
    previous_line += 1
    next_line += 1
  end
end

p schematic_sum("test_3.txt") == 4361
# p schematic_sum("input_3.txt")