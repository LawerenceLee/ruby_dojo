# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# users = [
#     ["Laurie", "Fletcher"],
#     ["Abigail", "Moon"],
#     ['Ralph', "Clearwater"],
#     ['Marie', "Rogers"],
#     ["Narcissa", "Draco"]
# ]

# users.each { |first_name, last_name| User.create(first_name: first_name, last_name: last_name, email_address: first_name+last_name+"@example.com") }


# (1..5).each { |num| Blog.create(name: "Blog#{num}", description: "Blog#{num} description")}

# blogs = Blog.all.limit(3)
# user1 = User.first
# blogs.each { |blog| Owner.create(blog: blog, user: user1)}

# blogs = Blog.all
# user = User.third
# blogs.each { |blog| Owner.create(user: user, blog: blog) }

# Owner.create(blog: Blog.fourth, user: User.second)

# Owner.create(blog: Blog.fifth, user: User.last)

# blog = Blog.second
# user = User.first
# (1..3).each { |num| Post.create(title: "Post #{num} Title", content: "This is the content of post #{num}", blog: blog, user: user) }

# user = User.second
# blog = Blog.last
# (1..5).each { |num| Post.create(title: "Post #{num} from user #{user.id}", content: "User #{user.id} made this", user: user, blog: blog)}

# blogs = Blog.all
# user = User.third
# blogs.each { |blog| Post.create(title: "#{user.first_name} created this", content: "This is content?", blog: blog, user: user) }

# user = User.third
# first_post = Post.first
# second_post = Post.second
# (1..2).each { |num| Message.create(author: "#{user.first_name}", content: "Posted by #{user.first_name} #{user.last_name} on the 6th of Apr", post: first_post, user: user) }
# (1..3).each { |num| Message.create(author: "#{user.first_name}", content: "Posted by #{user.first_name} #{user.last_name} on the 6th of Apr", post: second_post, user: user) }

# user = User.fourth
# last_post = Post.last
# (1..3).each { |num| Message.create(author: "#{user.first_name}", content: "Posted by #{user.first_name} #{user.last_name} on the 6th of Apr", post: last_post, user: user) }

# post = Post.second
# user = User.last
# Post.update(post.id, title: "#{user.first_name} created this", user: user)

# second = Post.second
# Post.update(second.id, content: "I am a modern major general")

# joins = "JOIN users ON messages.user_id = users.id JOIN posts ON messages.post_id = posts.id JOIN blogs ON posts.blog_id = blogs.id"
# Message.joins(joins).where("blogs.id = #{Blog.fifth.id}")

# Blog.first.owners.joins("JOIN users ON users.id = owners.user_id")