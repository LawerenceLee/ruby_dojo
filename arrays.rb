arr = ['a', 'n', 'i', 'm', 'a', 'l', 's']

puts arr.at(1)
puts arr.at(500).class

puts arr.fetch(1, "oops")
puts arr.fetch(500, "oops")
# puts arr.fetch(500)

puts "Delete_at"
puts arr.delete_at(-1)
puts "Delete"
puts arr.delete("a")
puts
puts "Print arr"
print arr
puts "puts arr"
puts arr

puts "Reverse"
print arr.reverse

puts "length"
puts arr.length

puts "Sort"
print arr.sort

puts "Slice"
print arr.slice(-2..-1)

puts "Shuffle"
print arr.shuffle
print arr

puts
puts "Join"
puts arr.join

puts "Insert"
print arr.insert(5, "RED")
puts
puts
puts arr[4] = "Replaced nul"
print arr 
puts

puts "Values at"
print arr.values_at(-2, -1)