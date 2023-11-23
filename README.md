# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. Implemented New Models, Controllers, and Views construct new features. Added auth with bcrypt. Used Rspec to test fetures. 

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Screenshots

!["Screenshot of home screen"](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_homescreen.png?raw=true)
!["Screenshot of products](https://github.com/BSMuse/photolabs-starter/blob/main/docs/photolabs_modal.png?raw=true)
!["Screenshot of login"](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_login.png?raw=true)
!["Screenshot of register](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_register.png?raw=true)
!["Screenshot of cart](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_cart.png?raw=true)
!["Screenshot of checkout](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_checkout.png?raw=true)
!["Screenshot of admin products](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_admin_products.png?raw=true)
!["Screenshot of admin categories](https://github.com/BSMuse/Jungle/blob/master/docs/jungle_admin_categories.png?raw=true)
