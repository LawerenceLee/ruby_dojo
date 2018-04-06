


# title and content, blog
blog1 = Blog.find(1)
posts_list = [["Range Rovin", "Drivin all over the country"], ["Hp Scotch", "The merger that should have never been"], ['Jumping For Joy', "Its a lifestyle"]]


values = posts_list.map { |u| "('#{u[0]}','#{u[1]}',#{blog1.id})" }.join(",")
ActiveRecord::Base.connection.execute("INSERT INTO posts (title, content, blog_id) VALUES #{values}")


posts_list.each { |title, content| Post.create(:title => title, :content => content, :blog => Blog.find(4)) }