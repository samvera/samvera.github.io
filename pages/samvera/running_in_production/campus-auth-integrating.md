---
title: "Integrating with Campus Authorization"
permalink: campus-auth-integrating.html
keywords: ["Integration", "Shibboleth", "CAS", "Authorization"]
tags: production
summary: "Examples of integrating with Shibboleth and CAS"
toc: false
---


### Authenticate against Shibboleth

There are probably many ways of doing this.

Data Curation Experts has a repeatable way for accomplishing it, documented  [here](https://curationexperts.github.io/playbook/authentication/shibboleth.html).

### Authenticate against CAS

Again, there are probably several ways to do this.  This method uses a gem called [https://github.com/nbudin/devise_cas_authenticatable](devise_cas_authenticatable).

#### Add the devise_cas_authenticatable gem

Add this line to your Gemfile:

    gem 'devise_cas_authenticatable'
    
Then run the command `bundle install`.

#### Modify the user model

Go to the file `app/models/user.rb`.  Find this line:

    attr_accessible :email, :password, :password_confirmation #default line from the basic hyrax installation
    
Replace it with:

    attr_accessible :email
    
Next, find these lines:

      devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
Replace them with:

      devise :cas_authenticatable, 
         :recoverable, :rememberable, :trackable
         
Finally, add a function that takes extra attributes from your CAS server and maps them to fields in the Hyrax contributor profile.  In this example, we will get the department name and email address.

      def cas_extra_attributes=(extra_attributes)
        extra_attributes.each do |name, value|
          case name.to_sym
          when :department
            self.department = value
          when :email
            self.email = value
          end
        end
      end
 
#### Modify the devise initializer

Go to `config/initializers/devise.rb` and add the following lines, adding your specific CAS URL.  There are [https://github.com/nbudin/devise_cas_authenticatable#setup](many more options) that you can add to this initialiazer.

    config.cas_base_url = '[YOUR CAS URL GOES HERE]'
    config.cas_user_identifier = 'email'
    config.cas_username_column = 'email'
    
#### Add a username field to your database

Create a migration like this:

    class AddUsernameToUsers < ActiveRecord::Migration[5.1]
      def change
        add_column :users, :username, :string
      end
    end
    
Run `rails db:migrate`
