---
title: "Email Notifications"
permalink: email_notifications.html
keywords: ["Email", "Notifications"]
last_updated:
sidebar: home_sidebar
toc: false
---

### Sending Notifications by Email
Hyrax uses a gem called [mailboxer](https://github.com/mailboxer/mailboxer) to send notifications within the application. You can also make it send these notifications by email. Information in this guide is drawn from [Messaging with Rails and Mailboxer](https://www.sitepoint.com/messaging-rails-mailboxer/) by Ilya Bodrov-Krukowski.

#### 1. Ensure you can send email from your application.
There is plenty of documentation for how to configure ActionMailer for various mail services. The [Action Mailer Basics](http://guides.rubyonrails.org/action_mailer_basics.html) guide is a good place to start.

Given a file `config/environments/development.rb`:
```ruby
config.action_mailer.perform_deliveries = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'email-smtp.us-east-1.amazonaws.com',
  port: '587',
  user_name: 'MY_USER_NAME',
  password: 'MY_PASSWORD',
  enable_starttls_auto: true
}
```

And a file `app/mailers/test_mailer.rb`:

```ruby
class TestMailer < ApplicationMailer
  def test_email
    mail(
      from: "you@yourdomain.com",
      to: "you@yourdomain.com",
      subject: "Test mail",
      body: "Test mail body"
    )
  end
end
```

On a rails console, you should be able to run `TestMailer.test_email.deliver` and see your email delivered.

#### 2. Tell mailboxer to use email
Edit the initializer for mailboxer at `config/initializers/mailboxer.rb`:

```ruby
Mailboxer.setup do |config|
  #Configures if you application uses or not email sending for Notifications and Messages
  config.uses_emails = true

  #Configures the default from for emails sent for Messages and Notifications
  config.default_from = "My Application Name <whatever@yourdomain.com>"

  #Configures the methods needed by mailboxer
  config.email_method = :mailboxer_email
  config.name_method = :display_name
  [...]
end
```

#### 3. Ensure your user model responds to the mailboxer methods
Now that you can send email from your application, make sure your User model has the methods it needs to mailboxer-style email. In the initializer, note that we set `name_method` to `:display_name`. Devise User objects in Hyrax have a method called display_name that works well here. However, the Devise `email` method won't work because the argument signature doesn't match what mailboxer is expected. Instead, edit `app/models/user.rb` and add a `mailboxer_email method`, like this:

```ruby
# Mailboxer (the notification system) needs the User object to respond to this method
# in order to send emails
def mailboxer_email(_object)
  email
end
```

That's it! Now when your Hyrax app sends notifications, it should send them by email as well as within the application.

## More helpful tips

### Setting ActionMailer hostname
If you get an error saying you don't have a hostname set, you might need to explicitly set your ActionMailer hostname. If you're only ever going to deploy this application to one production server, you could set it explicitly in `config/environments/production.rb`:
```
  config.action_mailer.default_url_options = { host: "yourhostname.domain.name" }
```

Or, if you're going to be deploying the same app to multiple servers and environments, you could reference an environment variable in  `config/application.rb`:
```ruby
  config.action_mailer.default_url_options = { host: ENV["ACTION_MAILER_HOST"] }
```
and set the `ACTION_MAILER_HOST` environment variable on the servers where you're running your application. To do this in Ubuntu, add this to `/etc/apache2/envvars`:
```
  export ACTION_MAILER_HOST=yourhostname.domain.name
```

### Customizing the subject lines of emails
By default, Mailboxer sends emails with subject lines that start with "Mailboxer new message: ". If you want to remove that, or customize what it says, copy the locale from https://github.com/mailboxer/mailboxer/blob/master/config/locales/en.yml to your local `config/locales/en.yml` file and customize it there.

### Including the full URL in email notifications
By default, Hyrax notifications use relative links. However, when you're sending notifications by email, the user is no longer within the context of the application, so those relative links won't work anymore. Instead, you're going to want to use fully qualified URIs.

1. Hyrax notifications use a method called `document_path`. You'll need to define a new method to use instead. Let's call it `document_url`. You can add this method wherever it makes sense in your application.
```ruby
  def document_url
    key = document.model_name.singular_route_key
    Rails.application.routes.url_helpers.send(key + "_url", document.id)
  end
```

2. Generating those urls is going to require that you've set the `:host` option for `default_url_options`. To do that, add a line like this at the end of your `application.rb` file:
```ruby
  Rails.application.routes.default_url_options[:host] = ENV["HYRAX_HOST"]
```
3. In your notifications, replace all instances of `document_path` with `document_url`
