# require "./MultiThreadedSort"

# using MultiThreadedSort
def self.pre_merge(ordered_left_array, ordered_right_array)
	# assert(ordered_left_array, :size)
	# assert(ordered_right_array, :size)
	puts "in side test********"
	assert (true)
end

def self.post_merge(ordered_left_array, ordered_right_array,return_array)
	original_checksum = ordered_left_array.inject(0){|sum,x| sum+x} + ordered_right_array.inject(0){|sum,x| sum+x}
	result_checksum = return_array.inject(0){|sum,x| sum+x}
	assert original_checksum = result_checksum, 'merge failed'
end