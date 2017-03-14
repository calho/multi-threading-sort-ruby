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

def pre_run_concurrently(array, comparator)
	assert_respond_to(array, :size, 'cant get size of passed array in run concurrently')
	assert_respond_to(comparator, :call, 'passed comparator is not callable')
end

def post_run_concurrently(thread)
	assert(thread.alive?, 'created thread is not alive')
	assert_respond_to(thread, :kill, 'thread created cant be killed')
end

def pre_merge_sort (output_array, comparator)
	assert_respond_to(output_array, :size, 'cant get size of passed array in merge sort')
	assert_respond_to(comparator, :call, 'passed comparator is not callable')
end

def post_merge_sort(output_array, return_array, left_thread, right_thread)
	original_size = output_array.size
	result_size = return_array.size
	assert(original_size == result_size, 'merge sort failed, missing objects')
	assert(!left_thread.alive?, 'left thread is still alive')
	assert(!right_thread.alive?, 'right thread is still alive') 
end

def pre_msort(duration, arr)
	assert(duration =~ /^\d+$/ ? true:false, 'invalid timeout, cant be negative and must be an integer')
	assert_respond_to(arr, :size, 'cant find size of array passed to msort')
end

def post_msort(result, arr, timeout_thread, elapsed_time, duration)
	assert(result.size == arr.size, 'result not same size as arr in msort')
	assert(!timeout_thread.alive?, 'timeout thread still alive')
	assert(elapsed_time < duration, 'timeout failed to to catch timeout')
end

def post_msort_timedout(timeout_thread)
	assert(!timeout_thread.alive?, 'timeout thread still alive after timeout')
end