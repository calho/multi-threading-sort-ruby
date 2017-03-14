def pre_merge(ordered_left_array, ordered_right_array)
	assert_respond_to(ordered_left_array, :size, "merging left array, but not an array")
	assert_respond_to(ordered_right_array, :size, "merging right array, but not an array")
end

def post_merge(ordered_left_array, ordered_right_array,return_array)
	original_size = ordered_left_array.size + ordered_right_array.size
	result_size = return_array.size
	assert original_size == result_size, 'merge failed, missing objects'
end

def pre_split(output_array)
  assert_respond_to(output_array, :size, "splitting non array")
end

def post_split(left_array, right_array, output_array)
  assert((left_array.size + right_array.size) ==output_array.size, "split failed")
  original_checksum = left_array.inject(0){|sum,x| sum+x} + right_array.inject(0){|sum,x| sum+x}
  result_checksum = output_array.inject(0){|sum,x| sum+x}
  assert original_checksum == result_checksum, 'split failed'
end
