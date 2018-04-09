# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

musicians = [
    "Johnny Cash",
    'Bob Dylan',
    'Jimi Hendrix',
    'Eric Clapton',
    'Boz Scagz',
]

musicians.each { |name| User.create(name: name) }