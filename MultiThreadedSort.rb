require "timeout"

require_relative 'multithreadedsortcontracts'
require 'test/unit'
module MultiThreadedSort

	extend Test::Unit::Assertions
	def self.get_comparator(&block)

		if !block_given?
			# puts "found no block"
			myproc= Proc.new{|a,b|a<=>b}
			return myproc
		end

		return Proc.new
	end

	def self.msort(duration, arr, &block)

		comparator = get_comparator(&block)
		begin
			timeout_thread= Thread.new{
				Timeout::timeout(duration){
					output_arr = arr.dup()
					start_index = 0
					end_index = output_arr.size()
					timeout_thread[:result]= merge_sort(output_arr, start_index, end_index,comparator)
				}
			}

			timeout_thread.join()
			return timeout_thread[:result]
		rescue Timeout::Error => e
			puts e.message
			puts "timed out"
			timeout_thread.kill
		end
	end

	def self.merge_sort(output_array, start_index, end_index, comparator)
		# puts "merge sort"
		if end_index <= 1
			return output_array
		end

		left_array, right_array = split(output_array)



		left_thread = run_concurrently(left_array, comparator)
		right_thread = run_concurrently(right_array, comparator)

		left_thread.join()
		right_thread.join()
		ordered_left_array=left_thread[:return_array]
		ordered_right_array=right_thread[:return_array]

		return_array = merge(ordered_left_array, ordered_right_array, comparator)

		return return_array



	end

	def self.run_concurrently(array, comparator)
		thread=Thread.new do
			Thread.current[:return_array] = merge_sort(array, 0, array.size(), comparator)
		end

		return thread
	end

	def self.split(output_array)
		pre_split(output_array)
		len = output_array.size
		m = (len/2).floor - 1

		left_array = output_array[0..m]
		right_array = output_array[m+1..len]
		post_split(left_array, right_array, output_array)
		return left_array, right_array
	end

	def self.merge(ordered_left_array, ordered_right_array, comparator)
		pre_merge(ordered_left_array, ordered_right_array)
		i = 0
		j = 0

		return_array = []

		if (ordered_left_array.size() == 1 and ordered_right_array.size() == 1)
			if 0 > comparator.call(ordered_left_array[0],ordered_right_array[0])#ordered_left_array[0] < ordered_right_array[0]
				return_array = ordered_left_array + ordered_right_array
			elsif 0 < comparator.call(ordered_left_array[0],ordered_right_array[0])# ordered_left_array[0] > ordered_right_array[0]
				return_array = ordered_right_array + ordered_left_array
			end
		else
			while ((i != ordered_left_array.size()) or (j != ordered_right_array.size()))
				if i == ordered_left_array.size()
					return_array << ordered_right_array[j]
					j+=1
				elsif j == ordered_right_array.size()
					return_array << ordered_left_array[i]
					i+=1
				elsif 0 <= comparator.call(ordered_left_array[i], ordered_right_array[j]) #ordered_left_array[i] >= ordered_right_array[j]
					return_array << ordered_right_array[j]
					j+=1
				elsif 0 > comparator.call(ordered_left_array[i], ordered_right_array[j]) #ordered_left_array[i] < ordered_right_array[j]
					return_array << ordered_left_array[i]
					i+=1
				end
			end
		end

		# post_merge(ordered_left_array, ordered_right_array,return_array)
		return return_array
	end

end
