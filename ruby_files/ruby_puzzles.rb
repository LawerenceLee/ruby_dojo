# Create an array with the following values: 3,5,1,2,7,9,8,13,25,32. Print the sum of all numbers in the array. Also have the function return an array that only include numbers that are greater than 10 (e.g. when you pass the array above, it should return an array with the values of 13,25,32 - hint: use reject or find_all method)

arr = [3, 5, 1, 2, 7, 9, 8, 13, 25, 32]
def puzz1(arr)
    puts arr.reduce(:+)
    return  arr.reject { |x| x < 11 }
end
print puzz1(arr)


# Create an array with the following values: John, KB, Oliver, Cory, Matthew, Christopher. Shuffle the array and print the name of each person. Have the program also return an array with names that are longer than 5 characters.

arr1 = %w(John KB Oliver Cory Matthew Christopher)
def puzz2(arr)
    arr.shuffle.each { |x| puts x}
    return arr.find_all { |x| x.length > 5 }
end
print puzz2(arr1)


# Create an array that contains all 26 letters in the alphabet (this array must have 26 values). Shuffle the array and display the last letter of the array. Have it also display the first letter of the array. If the first letter in the array is a vowel, have it display a message.
def puzz3()
    alpha_arr = ('a'..'z').to_a.shuffle
    puts alpha_arr[-1]
    if %w(a e i o u).any? { |vowel| alpha_arr[0] == vowel}
        puts "Welcome to the machine"
    end
end
puzz3


# Generate an array with 10 random numbers between 55-100.
arr2 = []
(10).times {arr2 << (55 + rand(45))}
print arr2
puts


# Generate an array with 10 random numbers between 55-100 and have it be sorted (showing the smallest number in the beginning). Display all the numbers in the array. Next, display the minimum value in the array as well as the maximum value

print arr2.sort!
puts
puts "MAX: #{arr2.max}"
puts "MIN: #{arr2.min}"


# Create a random string that is 5 characters long (hint: (65+rand(26)).chr returns a random character)
def randStr()
    str = ""
    5.times { str << (65 + rand(26)).chr }
    return str
end
puts str


# Generate an array with 10 random strings that are each 5 characters long

arr3 = []
(10).times { arr3 << randStr }
print arr3
