# README

### Deliverables
- [ ] Add a signup feature to API
- [ ] Add a login feature to API to include authentication
- [ ] Add a users show route that will authenicate a users session on the frontend as"/me"
- [ ] Add a logout feature to API

### Key points
- Cookies: a piece of information from the server to the browser. Stored in the client side. Cookies can be edited by the users, since they are stored in plain text.
- Sessions: signs and encrypts vulnerable data 
- Authentication: confirm validity, the user is who they say they are
- Stateless HTTP: s erver does not maintain information about each client for all requests .

The current problem we are aiming to solve is that HTTP is stateless. It does not remember important information, particularly about a user, between requests. Each request is handled individually.

To solve this error, we set sessions and cookies that are shared between the server and client and vice versa to keep track of certain information, including our users login.  

 ### Configuring Rails app to use cookies and sessions
 - Inside `config/application.rb` 
 ```rb

module ApiAuthentication
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_ony = true

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch:: Sessions::CookieStore
    config.action_dispatch.cookies_same_site_protection = :strict # ensures that cookies are only shared on the same domain
  end
end
```

- Inside `app/controllers/application-controller.rb` give access to cookies to all subsequent controllers.
 ```rb
 class ApplicationController < ActionController::Base
include ActionController::Cookies
end
```

### /signup
The user is here because they have not set up an account.
Essentially, we are going to create a new user object with the submitted form data.

### The flow
1. Client: at `"/signup"`, render a signup form.
2. Client: When user submits the form, make a `POST` fetch request to the endpoint `/signup`, with form data included.
3. Server: `users#create` will validate the newly created user object. If valid return a serialized user with a status of ok. If invalid, provide error messages and failure status.

### Setup
- Inside Gemfile, comment back in `bcrypt` and run `bundle update`
`bcrypt` allows us to call on the `has_secure_password` which adds multiple methods to the user model for reading, writing and encrypting passwords.

``` 
password=
password_confirmation=
authenticate

```
- Inside User Model add:
 
 ```
 has_secure_password

 ```
Encrypted passwords will be stored inside of a special column called `passwodr_digest`
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# ralis-api-client
