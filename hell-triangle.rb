# Hell Triangle - Challenge
# Given a triangle of numbers, find the maximum total from top to bottom
# Example:
# 6
# 3 5
# 9 7 1
# 4 6 8 4 In this triangle the maximum total is 6 + 5 + 7 + 8 = 26
# An element can only be summed with one of the two nearest elements in the next row
# So the element 3 in row 2 can be summed with 9 and 7, but not with 1
# Choose the programming language you want… let us know about why is that your choice
# Besides the solution itself, write an automated test for your code (using a known framework
# or just another function/method)
# Your code will receive an (multidimensional) array as input.
# The triangle from above would be:
# example = [[6],[3,5],[9,7,1],[4,6,8,4]]

def max_total(matrix)
  matrix.each_with_index do |row, level|
    if level > 0 
      parent_row = matrix[level - 1]
      (0..level).each do |i|
        node = row[i]
        left_parent = parent_row[i - 1] || 0 
        righ_parent = parent_row[i] || 0
        max_sum = [left_parent + node, righ_parent + node].max
        matrix[level][i] = max_sum
      end  
    end
  end
  matrix.last.max
end
