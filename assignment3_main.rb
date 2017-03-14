"Aaron Philips, Calvin Ho, Reem Maarouf
execution:
ruby assignment3_main.rb <timeout> <object list>
or
if you want list of randomly generated numbers, follow comments bellow
ruby assignment3_main.rb <timeout> <number of random numbers>"

require_relative 'ArrayMultithreadedSorting'

using ArrayMultithreadedSorting
include Test::Unit::Assertions

time = ARGV[0]

#uncomment the bellow two lines for randomly generated list
# number_of_object = ARGV[1].to_i#.tr('[]', '').split(",").map(&:to_i)
# array_of_objects = Array.new (number_of_object){rand(-100..100)}
#OR
#uncomment if you want to pass a list of objects, seperated by commas and no whitespaces
array_of_objects = ARGV[1].tr('[]', '').split(",")

puts "my unordered array"
p array_of_objects

puts

result = array_of_objects.m_merge_sort(time)

puts "ordered array"
p result

