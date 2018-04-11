# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    ["John", "Doe", "ruby"],
    ["Jane", 'Doe', 'js'],
    ["Michelle", "Smith", "python"],
    ["Test", "Testing", "Tester"],
]

# users.each { |f, l, lang| User.create(first_name: f, last_name: l, favorite_language: lang)}

posts = [
    ["Ruby is great", "Ruby is awesome", 1],
    ["JS TOday", "JS is really popular right now", 1],
    ["Pythong now", "Py is cool", 3],
]

# posts.each { |t, content, id| Post.create(title: t, content: content, user: User.find(id)) }