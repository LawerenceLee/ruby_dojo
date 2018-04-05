# Useful Commands

## Rails General Commands

#### New Project
    rails new app_name

#### Installing All Gems
    bundle install

#### New Model
    rails g model model_name field_name1:string field_name2:text

#### New Model w/ Foreign Key
    rails g model model_name lower_case_model_name:references

### Starting Rails Shell
    rails c

***
## ORM

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

#### Ordering 
    User.order(:first_name :desc)
More details: http://guides.rubyonrails.org/active_record_querying.html#ordering

#### Example of Custom Error message
```ruby
validates :age, presence: true, numericality: true, inclusion: { in: 10..150, message: "must be between 10-150" }
```
***
## Classes
#### Return all instance variables for a class.
```ruby
def context
    self.instance_variables.map do |attribute|
      { attribute => self.instance_variable_get(attribute) }
    end
end
```