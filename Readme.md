About
=== 

Real Time Notifications using faye in Rails.

Setup
=== 

*Development*

* Clone the project
* bundle install
* bundle exec rake db:create
* `rails s` and `bundle exec rackup private_pub.ru -s thin -E production`

Deployment(How I went about)
=== 
  
**AWS**
  
Got aws free(basic) instance 14.04 64bit 
RoR Set-up https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-14-04-using-rvm

**Latest GIT --version**

    sudo apt-add-repository ppa:git-core/ppa
    sudo apt-get update
    sudo apt-get install git

**Install Mongo** (Since there is no Mongo Support by AWS, directly installing on instance)

  https://www.digitalocean.com/community/tutorials/how-to-install-mongodb-on-ubuntu-14-04<br/>
  `service mongod stop, service mongod start`<br/>
  `sudo chown ubuntu:ubuntu ~/`<br/>
  Allow HTTP port 80 on AWS interface(permission)

**Apache + Passenger**

https://www.digitalocean.com/community/tutorials/how-to-deploy-a-rails-app-with-passenger-and-apache-on-ubuntu-14-04<br/>
    `sudo chown ubuntu: /etc/apt/sources.list.d/passenger.list`
    
**Configure Faye**

https://github.com/imnithin/faye-server
    
----

Note:

#### Sign up and add a Post, use an other tab to check if the new post in real time has reflected in the post listing page.
