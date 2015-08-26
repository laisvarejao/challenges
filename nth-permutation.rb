def nth_permutation(array, k)
	return '' if array.empty?
	permutations = factorial(array.length - 1)
	index = k/permutations
	new_k = k % permutations
	element = array[index]
	array.delete_at(index)
	"#{element}" + nth_permutation(array, new_k)
end

def factorial(n)
	(1..n).inject(:*) || 1
end

a = [0,1,2]
puts nth_permutation(a, 1)