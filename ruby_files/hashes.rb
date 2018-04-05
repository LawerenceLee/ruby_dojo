# dict = {:danger => "Keep outta here", :warning => "Look out"}
dict = {danger: "Keep outta here", warning: "Look out"}

# Accessing just keys
dict.each { |key, val| puts key }

# Accessing just values
dict.each { |key, val| puts val }

# Accessing values by key
puts dict[:danger]

# Checking for keys in hash
puts dict.has_key?(:greeting)
puts dict.has_key?(:warning)

# Checking for values in hash
puts dict.has_value?("Good evening")
puts dict.has_value?("Look out")

# Adding key, value pairs to dictionary
dict[:greeting] = "Good evening"
dict.each { |key, val| puts "#{key}, #{val}" }

# Removing Key, value pairs from a hash
puts dict.delete(:greeting)

# Checking if a hash is empty
puts dict.empty?