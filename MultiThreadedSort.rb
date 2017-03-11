require "timeout"
module MultiThreadedSort
	refine Array do 
		# def size
		# 	return -1
		# end
		def msort(duration)
			timeout_thread= Thread.new{
				Timeout::timeout(duration){
					output_arr = self.dup()
					start_index = 0
					end_index = output_arr.size()
					timeout_thread[:result]= merge_sort(output_arr, start_index, end_index)
				}
			}

			timeout_thread.join()
			return timeout_thread[:result]
		end

		def merge_sort(output_arr, start_index, end_index)
			# puts "merge sort"
			if end_index <= 1
				return output_arr
			end
			len = end_index
			m = (len/2).floor - 1
			# puts m
			left_array = output_arr[0..m]
			right_array = output_arr[m+1..len]
			# p left_array
			# p right_array

			left_thread=Thread.new do
				left_thread[:return_left_array] = merge_sort(left_array, 0, left_array.size())
			end
		

			right_thread=Thread.new do
				right_thread[:return_right_array]=merge_sort(right_array, 0 , right_array.size())
			end

			
			left_thread.join()
			right_thread.join()
			ordered_left_array=left_thread[:return_left_array]
			ordered_right_array=right_thread[:return_right_array]

			i = 0
			j = 0

			return_array = []



			# puts "comparing: "
			# p ordered_left_array
			# p ordered_right_array
			if (ordered_left_array.size() == 1 and ordered_right_array.size() == 1)
				return_array = ordered_left_array + ordered_right_array
			else
				while ((i != ordered_left_array.size()) or (j != ordered_right_array.size()))
					if i == ordered_left_array.size()
						return_array << ordered_right_array[j]
						j+=1
					elsif j == ordered_right_array.size()
						return_array << ordered_left_array[i]
						i+=1
					elsif ordered_left_array[i] >= ordered_right_array[j]
						return_array << ordered_right_array[j]
						j+=1
					elsif ordered_left_array[i] < ordered_right_array[j]
						return_array << ordered_left_array[i]
						i+=1
					end
				end
			end

			puts "returning"
			p return_array

			return return_array



		end

		def split(arr)
			istart
			iend
		end

		def merge

		end

	end


end
# merge_sort

# using MultiThreadedSort

# a = []
# a.funnymethod
# a.merge_sort