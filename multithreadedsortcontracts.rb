# require "./MultiThreadedSort"

# using MultiThreadedSort
def pre_merge(ordered_left_array, ordered_right_array)
	assert_respond_to(ordered_left_array, :size)
	assert_respond_to(ordered_right_array, :size)
end

def post_merge(ordered_left_array, ordered_right_array,return_array)
	original_checksum = ordered_left_array.inject(0){|sum,x| sum+x} + ordered_right_array.inject(0){|sum,x| sum+x}
	result_checksum = return_array.inject(0){|sum,x| sum+x}
	assert original_checksum = result_checksum, 'merge failed'
end