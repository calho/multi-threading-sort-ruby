require "./MultiThreadedSort"

using MultiThreadedSort

# a.merge_sort
# puts len

time = ARGV[0].to_i

number_of_elements = ARGV[1].to_i#.tr('[]', '').split(",").map(&:to_s)

puts time

array_of_objects = Array.new (number_of_elements){rand(-100..100)}

puts "my unordered array"
p array_of_objects	

puts

array_of_objects = array_of_objects.msort(time)#{|a,b| a.to_s <=> b.to_s}

puts "ordered array"
p array_of_objects


# def get_comparator(&block)

# 	if !block_given?
# 		myproc= Proc.new{|a,b|a<=>b} 
# 		return myproc 
# 	end
# 	puts block.arity
# 	return Proc.new
# end

# x=2
# y=3
# puts get_comparator{|x,y| x + y}.call(2,3)
# puts get_comparator.call(2,3)