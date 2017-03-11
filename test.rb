require "./MultiThreadedSort"

using MultiThreadedSort

# a.merge_sort
# puts len

time = ARGV[0]

object = ARGV[1].tr('[]', '').split(",").map(&:to_i)

puts time
puts "my unordered array"
p object

puts

ordered = object.sort

puts "ordered array"
p ordered


