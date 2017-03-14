require_relative 'MultiThreadedSort'
module ArrayMultithreadedSorting
	refine Array do
		include MultiThreadedSort
		# def size
		# 	return -1
		# end
		def m_merge_sort(duration)
			MultiThreadedSort.msort(duration, self)
		end


	end
end
