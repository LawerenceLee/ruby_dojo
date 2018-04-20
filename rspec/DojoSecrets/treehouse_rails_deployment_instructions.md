#Working w/ rails 5.0.1 and ubuntu 16.04


sudo apt-get update
sudo apt-get upgrade
sudo apt-get  install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs postgresql libpq-dev nginx

# in home dir
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

# add the following to bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

# exit out of shell and ssh back in
# run rbenv to check if it is installed correctly

# Add ruby-build plugin
$ mkdir -p "$(rbenv root)"/plugins
$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

$ rbenv install -v 2.3.1
$ rbenv global 2.3.1

# check ruby version
$ ruby -v

$ echo 'gem: --no-document' >> ~/.gemrc

# git clone proj into main dir

$ gem install bundler

# Inside your Gemfile
    # change rails version
        gem 'rails', '
    # change from
        gem 'sqlite3'
    # to
        gem 'pg', '~> 0.15'
    # inside production add
        production: do
            gem 'unicorn', '~> 5.2'
        end

# cd into proj dir
$ bundle install

$ sudo -u postgres createuser --superuser <your_dev_username>
# Inside <proj_folder>/config/database.yml
    # change adapter to
        adapter: postgresql
    # set encoding to
        encoding: unicode
    # remove timeout
    # set databases to match app name and env
        # for development
        database: <proj_name>_development
        # for testing
        database: <proj_name>_test
        # for production
            database: <proj_name>_production
    # change username to match the superuser you created
    production:
    <<: *default
    database: <proj_name>_production
    username: <your_dev_username>
    # add a password
    password: <%= ENV['<proj_name_all_caps_no_underscores_or_spaces>_DATABASE_PASSWORD'] %> 

# Create the production postgresql tables
$ RAILS_ENV=production bin/rake db:setup

# run to check if postgres and rails are playing together
$ RAILS_ENV=production bin/rake db

# Need to create a secret key for production
$ git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
$ bin/rake secret

# grab key that was printed to the screen and use it with the command below
$ echo 'SECRET_KEY_BASE=<secret_key>' >> .rbenv-vars
### example
$ echo 'SECRET_KEY_BASE=d8c6d91e806b9cc998f43170ff95710b0d44416bc813cca728a32fb03a661c79cfe6d2fc6709c7f
959c7a190cd61ace5828d3f38a5cae666ce7ec3301bd76d50' >> .rbenv-vars


$ RAILS_ENV=production bin/rake assets:precompile
$ echo 'RAILS_SERVE_STATIC_FILES=true' >> .rbenv-vars

# Configure Nginx
    #Inside rails dir
    $ cd config && vim nginx.conf

    # Add the following
    upstream unicorn {
    server unix:/tmp/unicorn.<proj_folder>.sock fail_timeout=0;
    }

    server {
    client_max_body_size 4G;
    listen 80 default;
    root /home/ubuntu/<proj_folder>/public;
    try_files $uri/index.html $uri @unicorn;
    location @unicorn {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass http://unicorn;
    }
    error_page 500 502 503 504 /500.html;
    }

sudo ln -s /home/ubuntu/<proj_folder>/config/nginx.conf /etc/nginx/sites-enabled/<proj_folder>

$ sudo rm -rf /etc/nginx/sites-enabled/default

$ vim config/unicorn.rb
# Inside unicorn.rb add the following 
    working_directory "/home/ubuntu/<proj_name>"
    pid "/home/ubuntu/<proj_name>/tmp/pids/unicorn.pid"
    stderr_path "/home/ubuntu/<proj_name>/unicorn/unicorn.log"
    stdout_path "/home/ubuntu/<proj_name>/unicorn/unicorn.log"

    listen "/tmp/unicorn.<proj_name>.sock"
    worker_processes 2
    timeout 30

$ mkdir -p tmp/pids 
$ touch tmp/pids/unicorn.pid
$ mkdir unicorn
$ touch unicorn/unicorn.log

# must run just inside app's root dir
RAILS_ENV=production bundle exec unicorn -c config/unicorn.rb -D

# test server with
$ sudo service nginx restart
$ RAILS_ENV=production bin/rails s