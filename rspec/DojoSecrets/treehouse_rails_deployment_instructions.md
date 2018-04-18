#Working w/ rails 5.0.1 and ubuntu 16.04


sudo apt-get update
sudo apt-get  install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev libffi-dev nodejs postgresql libpq-dev nginx

# in home dir
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

# add the following to bash_profile
eval "$(rbenv init -)"

# exit out of shell and ssh back in
# run rbenv to check if it is installed correctly

# Add ruby-build plugin
$ mkdir -p "$(rbenv root)"/plugins
$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

$ rbenv install -v 2.3.1
$ rbenv global 2.3.1

# check ruby version
$ ruby -v

$ vim ~/.gemrc
# add `vim ~/.gemrc` inside

# git clone proj into main dir

$ gem install bundler

# Inside your Gemfile
    # change from
        gem 'sqlite3'
    # to
        gem 'pg', '~> 0.15'
    # inside production add
        gem 'unicorn', '~> 5.2'

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
        database: DojoSecrets_development
        # for testing
        database: DojoSecrets_test
        # for production
            database: DojoSecrets_production
    # change username to match the superuser you created
    production:
    <<: *default
    database: DojoSecrets_production
    username: <your_dev_username>
    password: <%= ENV['DOJOSECRETS_DATABASE_PASSWORD'] %>
    
$ RAILS_ENV=production bin/rake db:setup

# run to check if postgres and rails are playing together
$ bin/rails db

# Need to create a secret key for production
$ git clone https://github.com/sstephenson/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
$ bin/rake secret
$ echo 'SECRET_KEY_BASE=<secret_key>' >> .rbenv-vars

$ RAILS_ENV=production bin/rake assets:precompile

# Configure Nginx
    #Inside rails dir
    $ cd config && vim nginx.conf

    # Add the following
    upstream unicorn {
    server unix:/tmp/unicorn.dojo_secrets.sock fail_timeout=0;
    }

    server {
    client_max_body_size 4G;
    listen 80 default;
    root /home/ubuntu/dojo_secrets/public;
    try_files $uri/index.html $uri @unicorn;
    location @unicorn {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass http://unicorn;
    }
    error_page 500 502 503 504 /500.html;
    }

sudo ln -s /home/ubuntu/dojo_secrets/config/nginx.conf /etc/nginx/sites-enabled/dojo_secrets

$ sudo rm -rf /etc/nginx/sites-enabled/default

# Create unicorn.rb inside config dir, and add the following 
    working_directory "/home/ubuntu/dojo_secrets"
    pid "/home/ubuntu/dojo_secrets/tmp/pids/unicorn.pid"
    stderr_path "/home/ubuntu/dojo_secrets/unicorn/unicorn.log"
    stdout_path "/home/ubuntu/dojo_secrets/unicorn/unicorn.log"

    listen "/tmp/unicorn.dojo_secrets.sock"
    worker_processes 2
    timeout 30

# must run just inside app's root dir
RAILS_ENV=production bundle exec unicorn -c config/unicorn.rb -D
