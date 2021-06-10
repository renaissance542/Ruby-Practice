require 'pry'
# binding.pry

def bubble_sort(arr)
  counter = 0
  sorted = false
  i = 0
  until sorted == true || (i == arr.length-1) do
    sorted = true
      for j in 0.. (arr.length-2-i)
        counter += 1
        if arr[j] > arr[j+1]
          swap(arr, j, j+1) 
          sorted = false
        end
      end
    i += 1
  end
  puts "counter = #{counter}"
  arr
end

def swap(arr, i, j)
  # puts "swapping arr[#{i}] with arr[#{j}]"
  temp = arr[i]
  arr[i] = arr[j]
  arr[j] = temp
end

p bubble_sort([3, 5, 1, 2, 6, 4])
p bubble_sort([12,97,8,15,33,92,48])
p bubble_sort([-7,23,94, -52, 38, 42])
