# Useful Commands

## Rails General Commands

#### New Project
    $ rails new app_name

#### Starting Server
    $ bin/rails s
*The use of bin makes sure the server is using the version of rails that you built your app in*

#### Simplifying the messages in the console

You may find what's logged in the console to be too much, making it harder for you to navigate things you printed/put in the controller as it may be buried underneath all the other logged messages. To prevent many logged activities from appearing in the console, you can adjust your config/environments/development.rb and add the following:

    config.log_level = :warn 

#### Installing All Gems
    $ bundle install

#### New Model
    $ rails g model ModelName field_name1:string field_name2:text

#### New Model w/ Foreign Key
    $ rails g model ModelName lower_case_model_name:references

#### Starting Rails Shell
    $ rails c

#### Seeding DB
    $ rake db:seed

#### Migration
    $ rake db:migrate
    $ rake db:migrate:status

#### Controllers
```bash
$ rails g controller <ControllerNamePluralUpperCase>

or

$ rails g controller <ControllerNamePluralUpperCase> <methods space seperated>
```
*Created a file: `app/controllers/<ControllerNamePluralLowerCase>_controller.rb.`*
***
## ORM

#### Cascade Delete
```ruby
...
has_many :ninjas, dependent: :delete_all
...
```
*To be placed inside a models .rb file*


### Model Commands

#### Destroying Records
```ruby
Model.find(record_id).destroy
Model.delete_all
```

#### Errors (seeing them in a failed attempt to create a DB record)
```ruby
variable_of_record.errors.full_messages
```

#### LIKE Statement
```ruby
Player.joins(:team).where("players.name LIKE 'Z%'").pluck("teams.name")
```

#### Ordering 
```ruby
User.order(first_name: :desc)
```
*More details: http://guides.rubyonrails.org/active_record_querying.html#ordering*

#### Pluck 
Use pluck as a shortcut to select one or more attributes without loading a bunch of records just to grab the attributes you want.

```ruby
Player.pluck(:name) # just the names column as a list
Player.joins(:team).where("teams.stadium = 'Staples Center'").pluck(:name, "teams.name")
```

#### Raw SQL Join
```ruby
joins = "JOIN users ON messages.user_id = users.id JOIN posts ON messages.post_id = posts.id JOIN blogs ON posts.blog_id = blogs.id"
Message.joins(joins).all
```

#### Selecting Fields 
```ruby
Dojo.find(2).ninjas.select(:first_name)
```

#### Update
```ruby
Model.update(id, :attribute => "new value")
```

#### Using Where
```ruby
Blog.where("id < 5")
Player.includes(:team).where("teams.name = 'Los Angeles Lakers'").references(:team)
Player.joins(:team).where("teams.name = 'Los Angeles Lakers'")
```

### Validation
#### Custom Error message
```ruby
validates :age, presence: true, numericality: true, inclusion: { in: 10..150, message: "must be between 10-150" }
```
#### Email
```ruby
EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
validates :email, presence: true, uniqueness: { case_sensitiveness: false }, format: { with: EMAIL_REGEX }
```
#### Length
```ruby
class Person < ApplicationRecord
    validates :name, length: { minimum: 2 }
    validates :bio, length: { maximum: 500 }
    validates :password, length: { in: 6..20 }
    validates :registration_number, length: { is: 6 }
end
```
*** 
## Routing

#### Creating Routes
Creating a custom route
```ruby
# /config/routes.rb

# HTTP_VERB "<relative URL>" => "controller#method"
get "profile" => "users#show"
```

Creating ReSTful routes with a single line
```ruby
# /config/routes.rb

resources :products
# will create the following routes:
    # get "products" => "products#index"
    # get "products/new" => "products#new"
    # post "products" => "products#create"
    # get "products/:id" => "products#show"
    # get "products/:id/edit" => "products#edit"
    # patch "products/:id" => "products#update"
    # delete "products/:id" => "products#destroy"
```
*Use: `rake routes` to see the list above outputed to the terminal*

### Named Routes
```ruby
# Prefix Verb   URI Pattern                 Controller#Action    Route Name
get             "/users",                   to: "users#index",   as: :users
post            "users(.:format)",          to: "users#create" 
get             "users/new(.:format)",      to: "users#new",     as: :new_user
get             "users/:id",                to: "users#show",    as: :user
get             "users/:id/edit(.:format)", to: "users#edit",    as: :edit_user
patch           "users/:id(.:format)",      to: "users#update"
put             "users/:id(.:format)",      to: "users#update"
delete          "users/:id(.:format)",      to: "users#destroy"
```

### Routing "/"
    root :to => "pages#show"

#### Advanced Routing
http://guides.rubyonrails.org/layouts_and_rendering.html
***
## Controllers

Rendering by default - A controller assumes that you want to render a method's associated html document if it has one (hence why rails generated methods do not have render or redirect statments). If you'd like to deviate from this behavior you must specify said action. If you want to render a different html file, you can do so using either `render "filename"` or `render "folder/filename"` if it is in a different view folder. If you'd like to redirect, you simply specify which controller's view you'd like to be routed to with `redirect_to "<controller>/<method>"`.

### Creating (w/form) and Checking DB entries 
```ruby
def create
    # use params to access form data
    @product = Product.create( name: params[:name], description: params[:description])
    puts @product.inspect  # prints record to terminal
    redirect_to '/products/index'
end
```

### Destroying Controllers
`$ rails d controller Controller_name`

### Rendering a simple line of text
```ruby
def some_method
    render text: "Hey Look I rendered some text in the browser"
end
```

### Rendering JSON
```ruby
def index
  @products = Product.all
  render json: @products
end
```

### ReSTful Controller Views w/ one command
```ruby
rails g scaffold_controller Products
```

### Signed In or new user view
This method checks if a users is signed in. If so it will redirect to the profile method by using the "<controler>/<method>" convention. If the if statement is not executed, then we will just render the new.html.erb view in the users view folder
```ruby
def new
    if signed_in?
        redirect_to "/users/profile"
    end
end
```
***
## Rails Templating
```ruby
class UsersController < ApplicationController
    def index
        @users = User.all
    end
end
```
```html
<h1>Listing Users</h1>
<table>
  <thead>
    <tr>
      <td>First Name</td>
      <td>Last Name</td>
      <td>Email</td>
    </tr>
  </thead>
  <tbody>
  <% @users.each do |user| %>
    <tr>
      <td><%= user.first_name %></td>
      <td><%= user.last_name %></td>
      <td><%= user.email %></td>
    </tr>
  <% end %>  
  </tbody>
</table>
```

#### Authenticity Token for Forms
```html
<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
```
***
## Forms
```html
<%= form_for(@user) do |f| %>
  <% if @user.errors.any? %>
    <div id="error_explanation">
      <h2><%= pluralize(@user.errors.count, "error") %> prohibited this user from being saved:</h2>

      <ul>
      <% @user.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
      </ul>
    </div>
  <% end %>

  <div class="actions">
    <%= f.text_field :name %>
    <%= f.submit %>
  </div>
<% end %>
```
#### Fixing undefined method 'modelname_path' for ...
Change your top line from:
```html
<%= form_for(@ninja) do |f| %>
```
To:
```html
<%= form_for(@ninja, url: "<the_url_path_you_want>") do |f| %>
```
*Rails defaults to thinking your app is configured w/ a ReSTful route architecture, when its not you need to specify your url's path*

http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html#method-i-form_for-label-Resource-oriented+style


There is another way this can be done:
```html
<form action='/products/' method='post'>
  <input type='text' name='product[name]' placeholder='name' />
  <input type='text' name='product[description]' placeholder='description' />
  <input type='submit' value='Create' />
</form>
```

#### Patch Method w/o using Form Helpers
```html
<form action="/blogs/<%= blog.id %>" method="post">
    <input type="hidden" name="_method" value="patch">
</form>
```

#### Delete Method with Form Helper
A JavaScript file included in the Rails' scaffolding code automatically looks for data-method in the anchor tag and submits a post with the _method parameter set to delete, like in the form above.
```html
<a href="/blogs/<%= blog.id %>" data-method="delete">Delete this blog!</a>
```

***
## Flash
```ruby
if errors?
    flash[:error] = "You have errors"
    redirect_to '/users/' #pathing will be explained later
else
    flash[:success] = "You did it!"
    redirect_to '/users/'
end
```
```html
<!-- html snippet for Flash -->
<% flash.each do |key, value| %>
    <%= content_tag :div, value, class: "flash #{key}" %>
<% end >%
```
*Flash Shortcuts below:*
```ruby
redirect_to root_url, flash: { referral_code: 1234 }
redirect_to root_url, notice: "You have successfully logged out."
redirect_to root_url, alert: "You're stuck here!"
```
The top example is the most common way to pass values to the flash. The next two examples are a shortcut in Rails. The symbols  :notice and :alert are so common as keys in flash that you do not have to use the keyword :flash beforehand. Rails knows that :notice and :alert are both inside the flash.
***
## Session
Setting session keys
```ruby
def create
    #adds the value in params[:id] to the :id key in session
    session[:id] = params[:id] #we will talk about params in a bit
  end
  def log_out
    #sets the session[:id] to nil, overwriting the previous value
    session[:id] = nil
end
```
Clearing Session

* `session.clear`
* `reset_session`

*** 
## Rails Console

#### Hirb
    Hirb-enable

#### Reloading
    reload!

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
***
## Dates and Times
https://www.tutorialspoint.com/ruby/ruby_date_time.htm

## Definitions

* Model: Writes Ruby objects to the database and reads them later
* Views: Shows data to users, most often in HTML
* Controllers: Respond to requests by users, cordinates with Model and View

## Helpful Gems

* hirb
* rails_footnote => Installation Below
    ```ruby
    # Inside gems.rb
    gem 'rails-footnotes', '>= 4.0.0', '<5'
    ```
    ```bash
    $ bundle install
    $ rails generate rails_footnotes:install
    ```
***
## Pastable Development Gems
```ruby
   gem 'hirb' 
   gem 'rails-footnotes', '>= 4.0.0', '<5'
```