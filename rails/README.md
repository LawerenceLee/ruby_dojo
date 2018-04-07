# Useful Commands

## Rails General Commands

#### New Project
    rails new app_name

#### Starting Server
    bin/rails server
    *The use of bin makes sure the server is using the version of rails that you built your app in*`

#### Installing All Gems
    bundle install

#### New Model
    rails g model ModelName field_name1:string field_name2:text

#### New Model w/ Foreign Key
    rails g model ModelName lower_case_model_name:references

### Starting Rails Shell
    rails c

***
## ORM

#### Using Hirb
    Hirb-enable

#### Cascade Delete
    ...
    has_many :ninjas, dependent: :delete_all
    ...

#### Migrating
    rake db:migrate

#### Status of Migrations
    rake db:migrate:status

#### Reloading Rails Console
    reload!

#### Update
    Model.update(id, :attribute => "new value")

#### Seeing Errors in creating a DB record
    variable_of_record.errors.full_messages

#### Email Validation
```ruby
EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
```

#### Destroying Records
    Model.find(record_id).destroy

#### Selecting Fields 
    Dojo.find(2).ninjas.select(:first_name)

#### Specifying Raw SQL Join
    joins = "JOIN users ON messages.user_id = users.id JOIN posts ON messages.post_id = posts.id JOIN blogs ON posts.blog_id = blogs.id"
    Message.joins(joins).all

#### Using Where
    Blog.where("id < 5")
    Player.includes(:team).where("teams.name = 'Los Angeles Lakers'").references(:team)
    Player.joins(:team).where("teams.name = 'Los Angeles Lakers'")

#### Ordering 
    User.order(first_name: :desc)
More details: http://guides.rubyonrails.org/active_record_querying.html#ordering

#### Example of Custom Error message
```ruby
validates :age, presence: true, numericality: true, inclusion: { in: 10..150, message: "must be between 10-150" }
```

#### Validating Length
    class Person < ApplicationRecord
        validates :name, length: { minimum: 2 }
        validates :bio, length: { maximum: 500 }
        validates :password, length: { in: 6..20 }
        validates :registration_number, length: { is: 6 }
    end

#### Working with .pluck 
Use pluck as a shortcut to select one or more attributes without loading a bunch of records just to grab the attributes you want.

    Player.pluck(:name) # just the names column as a list
    Player.joins(:team).where("teams.stadium = 'Staples Center'").pluck(:name, "teams.name")

#### Using a LIKE Statement
    Player.joins(:team).where("players.name LIKE 'Z%'").pluck("teams.name")
dd
***
## Classes

#### Printing all methods for an object
    p 2.methods.sorts

#### Return all instance variables for a class.
```ruby
def context
    self.instance_variables.map do |attribute|
      { attribute => self.instance_variable_get(attribute) }
    end
end
```

***
## Ruby and Rails Installation
```bash
$ brew install gpg
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
$ source /Users/lawerencelee/.rvm/scripts/rvm
$ rvm install 2.3.1
$ rvm use 2.3.1 --default
$ gem install bundler --no-ri --no-rdoc
$ gem install rails -v 4.2.7 --no-ri --no-rdoc
```

## Definitions

* Model: Writes Ruby objects to the database and reads them later
* Views: Shows data to users, most often in HTML
* Controllers: Respond to requests by users, cordinates with Model and View
