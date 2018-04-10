# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


dojos = [
    ['Seattle', "1111 Main St", "Bellevue", "WA"],
    ['San Jose', '2222 Zanker Rd', 'San Jose', 'CA'],
    ['Burbank', '3333 Olive Ave', 'Burbank', 'CA'],
    ['Chicago', '4444 Institute Pl', "Chicago", "IL"]
]

dojos.each { |branch, street, city, state| Dojo.create(branch: "CD " + branch, street: street, city: city, state: state) }
