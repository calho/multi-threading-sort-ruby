require "./MultiThreadedSort"

using MultiThreadedSort

# a.merge_sort
# puts len

time = ARGV[0].to_i

number_of_object = ARGV[1].to_i#.tr('[]', '').split(",").map(&:to_i)

puts time

array_of_objects = Array.new (number_of_object){rand(-100..100)}

puts "my unordered array"
p array_of_objects	

puts

result = array_of_objects.msort(time)

puts "ordered array"
p result


