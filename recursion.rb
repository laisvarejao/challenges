## Jobs Friday: Recursion

# 1. Write a naïve Fibonacci function recursively. The Fibonacci sequence looks like this: 1, 1, 2, 3, 5, 8... 
def fibonacci(n)
	return  n  if n <= 1
	fibonacci(n - 1) + fibonacci(n - 2)
end

# 2. Finish this code for finding the largest number in a list:
def max(numbers, largest_so_far=0)
  next_num = numbers.shift
  unless next_num
    largest_so_far
  else
    largest_so_far = next_num if next_num > largest_so_far
    max(numbers, largest_so_far)
  end
end

# 3. Using no loops (for, while, etc.), and no global variables, write a function that returns the sum of a list.
# Also, no cheating and calling methods that do significant work for you (i.e. sum(), reduce(), etc. are all off limits).
def sum(numbers)
  next_num = numbers.shift
  next_num ? next_num + sum(numbers) : 0
end

def sum_cheat(numbers)
  numbers.inject {|sum, x| sum + x}
end

# 4. Again, using no loops, no global variables, and without asking for the length of the array except to check if it's empty, write a function that returns the last index of a given input in a list. 
# Negative one gets returned if the element doesn't occur in the list. Don't go from the back. 
# Feel free to change to the signature of the function or use a helper function with a different signature! 
# (hint: that means you can make your function take more arguments - ex: `lastIndexOf(5, [1,2,3], 0)`
# lastIndexOf(5, [1, 2, 4, 6, 5, 2, 7]) -> 4
# lastIndexOf(5, [1, 2, 4, 6, 2, 7]) -> -1
# lastIndexOf(5, [1, 2, 5, 4, 6, 5, 2, 7]) -> 5
def last_index_of(num, numbers, current_index=-1, last_index=-1)
  current_index += 1
  next_num = numbers.shift
  if next_num
    last_index = current_index if next_num == num
    last_index_of(num, numbers, current_index, last_index)
  else
    last_index
  end
end

def last_index_of_cheat(num, numbers)
  numbers.rindex(num)
end
