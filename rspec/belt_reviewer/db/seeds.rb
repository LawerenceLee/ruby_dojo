# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create(first_name: "Mr.", last_name: "Admin", email: "mradmin@mydomain.com", location: "999 Hell Street", state: "AZ", password: "password1"

# User.create(first_name: "Mr.", last_name: "Kaz", email: "KAZ@mydomain.com", location: "999 Hell Street", state: "AZ", password: "password1")


events = [
#     ["Dancing on Nazi graves night", "2018-12-05", "Munich", "TN", User.find(1)], 
#     ["Square dancing", "2018-01-02", "Newton", "AK", User.find(2)],
#     ["Air Guitar Festival", "2018-11-01", "Bridgeview", "TN", User.find(1)] 
    # ["Deaf Music Festival", "2018-11-01", "Bridgeview", "AK", User.find(1)] 
]

events.each do |name, date, location, state, user|
    Event.create(name: name, event_date: date, location: location, state: state, user: user)
end