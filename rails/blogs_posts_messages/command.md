# Ruby Commands

## Blog Commands
```ruby
Comment.create(content: "This is a comment", model: Blog.first)
Comment.update(1, content: "Blogs are cool")
Blog.first.comments
Destroy one comment--> Blog.first.comments.where("comments.id = 1").delete_all
Destroy all comments--> Blog.first.comments.destroy_all
```

## Post Commands
```ruby
Comment.create(content: "This is a comment", model: Post.first)
Comment.update(2, content: "Posts are cool")
Post.first.comments
Destroy one comment--> Post.first.comments.where("comments.id = 2").delete_all
Destroy all comments--> Post.first.comments.destroy_all
```

## Message Commands
```ruby
Comment.create(content: "This is a comment", model: Message.first)
Comment.update(3, content: "Messages are cool")
Message.first.comments
Destroy one comment--> Message.first.comments.where("comments.id = 3").delete_all
Destroy all comments--> Message.first.comments.destroy_all
```

## User Commands
```ruby
Comment.create(content: "This is a comment", model: User.first)
Comment.update(4, content: "Users are cool")
User.first.comments
Destroy one comment--> User.first.comments.where("comments.id = 5").delete_all
Destroy all comments--> User.first.comments.destroy_all
```
