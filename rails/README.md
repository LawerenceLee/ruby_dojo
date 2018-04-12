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

#### Raw SQL
```ruby
ActiveRecord::Base.connection.execute("Your query goes here")
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
<%= form_for(@user, url: "") do |f| %>
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
    
    <div class="fields">
        <%= label_tag(:first_name, "First Name:") %>
        <%= f.text_field :first_name %><br>
        <%= label_tag(:last_name, "Last Name:") %>
        <%= f.text_field :last_name %><br>
        <%= label_tag(:favorite_language, "Favorite Language:") %>
        <%= f.text_field :favorite_language %><br>

        <!-- Other Examples -->
        <%= f.collection_select(:user, User.all, :id, :first_name) %>
        <% peoples_array = User.all.map { |user| ["#{user.first_name} #{user.last_name}", user.id] } %>
        <%= select_tag(:user, options_for_select(peoples_array)) %>
    </div>

    <div class="actions">
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
<% end %>
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
## Layouts
```ruby
class StudentsController < ApplicationController
  # only the index and the new action will be loaded through app/views/layouts/dojos.html.erb
  layout "dojos", only: [:profile, :info]
  
  def index
    # renders with app/views/layouts/students.html.erb
  end
  
  def new
    # renders with app/views/layouts/students.html.erb
  end
  
  def profile
    # renders with app/views/layouts/dojos.html.erb
  end
  
  def info
    # renders with app/views/layouts/dojos.html.erb  
  end
  
  def hello_world
    render layout: "application"
     # renders with app/views/layouts/application.html.erb
  end
end 
```

#### Structuring Layouts
```ruby
<!-- app/views/layouts/students.html.erb -->
<!DOCTYPE html>
<html>
    <head>
        <title> Dojo Dashboard | <%= yield :title %> </title>
        <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
        <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
        <%= csrf_meta_tags %>
    </head>
    <body>
        <script type="text/javascript">
            <%= yield :some_javascript %>
        </script> 
        <%= yield %>
    </body>
</html>

<!-- app/views/users/index.html.erb -->
<% content_for :title, "All Users" %>
<% content_for :some_javascript do %>
    alert("This alert comes from the all users page");
<% end %>
<h1>Listing all users</h1>
<p>This is where you would have some code to display all the users</p>

<!-- app/views/users/new.html.erb -->
<% content_for :title, "New User" %>
<% content_for :some_javascript do %>
    alert("This alert comes from the new user page");
<% end %>
<h1>New User</h1>
<p>This is where you would have a form to create a new user</p>
```

#### Asset Tag Helpers
* auto_discovery_link_tag (for RSS or Atom feeds)
* javascript_include_tag (linking Javascript files)
* stylesheet_link_tag (linking to CSS files)
* image_tag (linking to image files)
* video_tag (linking to video files)
* audio_tag (linking to audio files)
*http://api.rubyonrails.org/classes/ActionView/Helpers/AssetTagHelper.html*

#### Partials
```ruby
<!-- app/views/shared/_header.html.erb -->
<header>
    <h1>This can be a header shared by multiple views</h1>
</header>


<!-- app/views/shared/_footer.html.erb -->
<footer>
    <h1>This can be a footer shared by multiple views</h1>
</footer>


<!-- app/views/users/student_partial.html.erb -->
<div>
    <p>A paragraph that needs to be in all views for the students resource</p>
</div>


<!-- app/views/users/index.html.erb -->
<!-- rendering the header partial from another folder. Notice the omission of the underscore -->
<%= render "shared/header" %>
<h1>This is the index view for all the students</h1>
<!-- rendering the user_partial from the same folder. -->
<%= render "student_partial" %>
<!-- rendering the footer partial from another folder. -->
<%= render "shared/footer" %>
```
***
## Link Tags
```ruby
<%= link_to  "Link Name", path_as_symbol_str_or_path %>
```
***
## RSpec

### Setup
1. Create an test file... `someProject_spec.rb`
2. Be sure the file you are testing is adjacent to your test file.
3. To run tests: `rspec someProject_spec.rb` or to run all test files `rspec .`

```ruby
require_relative 'project' # include our Project class in our spec file
RSpec.describe Project do  
  before(:each) do 
    @project1 = Project.new('Project 1', 'description 1') # create a new project and make sure we can set the name attribute
  end
  it 'has a getter and setter for name attribute' do
    @project1.name = "Changed Name" # this line would fail if our class did not have a setter method
    expect(@project1.name).to eq("Changed Name") # this line would fail if we did not have a getter or if it did not change the name successfully in the previous line.
  end 
end
```

### describe
The purpose of describe method is to wrap a set of tests against one functionality. For example, we can use the describe method to group together all the tests associated with buying soda.
```ruby
RSpec.describe "Buy a soda" do
  # test code here
end
```

### context
The purpose of context is very similar to describe, but the key difference is that it groups together a set of tests against one functionality under the same state. You should use context when testing bigger projects, or when dealing with objects that have different states.
```ruby
RSpec.describe "Buy a soda" do 
    context "has money" do 
        # test code here
    end
    context "doesn't have money" do
        # test code here
    end
end
```
### it
The purpose of it is to describe the specific functionality you're testing in any given context. It is important to be as descriptive as you can because it will help you identify which tests have failed or passed.
```ruby
RSpec.describe "Buy a soda" do 
    context "has money" do 
        it "buy the soda" do 
            # test to try to buy soda with some money
        end
    end
    context "doesn't have money" do
        it "can't buy the soda" do 
            # test to try to buy soda without money
        end
    end
end
```

### expect
We can make several different assertions with RSpec. The one that we will be focusing on is expect. In this case, we will be using expect to establish what the intended outcome of a particular method call should be.
```ruby
RSpec.describe "Buy a soda" do 
    context "has money" do 
        it "buy the soda" do 
            buyer = Buyer.new
            buyer.money = 10
            expect(buyer.buy_soda).to eq(true)
        end
    end
    context "doesn't have money" do
        it "can't buy the soda" do 
            buyer = Buyer.new
            buyer.money = 0
            expect(buyer.buy_soda).to eq(false)
        end
    end
end
```

### before
before runs the given block of code before each test. before will help keep you from repeating code. We will be using before to run a block of code before each "context" statement and before each "it" statement.
```ruby
RSpec.describe "Buy a soda" do
    before(:each) do 
        @buyer = Buyer.new
    end
    
    context "has money" do
        before(:each) do 
            @buyer.money = 10
        end 
        it "can buy a soda" do 
            expect(@buyer.buy_soda).to eq(true)
        end
    end
    context "doesn't have money" do
        before(:each) do 
            @buyer.money = 0
        end     
        it "can't buy a soda" do
            expect(@buyer.buy_soda).to eq(false)
        end
    end
end
```
The benefits of the before statement might not be so apparent in this simple example, but as you add more tests, it will make your tests more concise and easier to understand. Also, remember that before runs the code block before each "context" and "it" statements. In our example code, we are making sure that every time we have a new context, we have a new buyer. And inside each it block, we set the buyer's money to match the context of what we are trying to test.
```ruby
RSpec.describe "something" do
    before(:each) do 
        Buyer.create
    end
    it "assertion 1" do
      # test code here
    end
    it "assertion 2" do 
       # test code here    
    end
    it "assertion 3" do 
      # test code here
    end
end
```

## Expectations
#### Modifier - These are RSpec methods that help us read an expectation better:
    expect
#### Matchers - These usually consist of boolean operators. e.g:
    >
    <
    >=
    <=
    ==
#### Predicate Matcher - Commonly paired with the should modifier.
    be_valid
    be_within
    be_a_kind_of
    be_an_instance_of
    be_true
    be_false
    be_nil
    ...
##### Alt ways of writing should and be:
Alternative ways of writing should and be: 
Example 1: player.ammo.should be > 10
```ruby
player.ammo.should > 10
player.ammo.should_not <= 10
player.ammo.should_not be <= 10
```
Example 2: ninja.happy?.should be_true (take note of the predicate method happy? predicate methods are boolean methods that end with a ?. These methods return either with true or false)
```ruby
ninja.happy?.should == true
ninja.happy?.should_not == false
ninja.happy?.should_not be_false
ninja.happy?.should eq true
ninja.should be_happy
```

## RSpec Expectations
From the beginning, RSpec::Expectations provided should and should_not methods to define expectations on any object. In version 2.11, the expect method was introduced which is now the recommended way to define expectations on an object.

Using the examples above, we can translate it to RSpec's expect and to format.

Example 1: player.ammo.should be > 10
```ruby
expect(player.ammo).to be > 10
expect(player.ammo).to_not be <= 10
```
Example 2: ninja.happy?.should be_true
```ruby
expect(ninja.happy?).to be_true
expect(ninja).to be_happy
```
More info about expectation: RSpec Expectations Documentation

*https://github.com/rspec/rspec-expectations/blob/master/Should.md*

## Testing for Errors
```ruby
# person/person.rb
class Person
  def initialize name
    @name = name
  end

# person/person_spec.rb
require_relative 'person'
RSpec.describe Person do
  it "can't initialize user without name" do 
    expect{Person.new}.to raise_error(ArgumentError)
  end
  
  it "can't change users name" do
    user = Person.new "Oscar"
    expect{user.name = "Eduardo"}.to raise_error(NoMethodError)
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