
require_relative 'ArrayMultithreadedSorting'

using ArrayMultithreadedSorting
include Test::Unit::Assertions
# a=[4,2,3,4,1289,46,324,-234]
# a.m_merge_sort(1000)
# a.merge_sort
# puts len

time = ARGV[0].to_i

number_of_object = ARGV[1].to_i#.tr('[]', '').split(",").map(&:to_i)

puts time

array_of_objects = Array.new (number_of_object){rand(-100..100)}

puts "my unordered array"
p array_of_objects

puts

result = array_of_objects.m_merge_sort(time)
# puts "ordered array"
# p array_of_objects
# begin
#   result = array_of_objects.m_merge_sort(time)
puts "ordered array"
p result
p result.size
# rescue Test::Unit::AssertionFailedError => e
#   # puts e.backtrace
#   p array_of_objects
#   p e.message
# end
