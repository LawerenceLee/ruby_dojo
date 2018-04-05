names = [
    {first_name: "Michael", last_name: "Choi"},
    {first_name: "John", last_name: "Doe"},
    {first_name: "Jane", last_name: "Doe"},
    {first_name: "James", last_name: "Smith"},
    {first_name: "Jennifer", last_name: "Smith"},
]

puts "You have #{names.count} in the 'names' array"
names.each {|dict| puts "The name is '#{dict[:first_name]} #{dict[:last_name]}'" }
