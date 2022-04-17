# Micolet Challenge

Develop a simple landing page where people interested in receiving the newsletter can submit their email and select their preferences between: Women's Fashion, Men's Fashion and Children's Fashion.

## Installation

Use Ruby [Bundler](https://bundler.io/man/bundle-install.1.html) to install the gems needed.

```bash
bundle install
```

## Usage

```rails
# create the database
rails db:create
rails db:seed
# open the rails server
rails server
```

Then go directly to your [Localhost 3000](http://localhost:3000).

## Test

We used [RSpec](https://rspec.info/) testing tool for testing the app.
We created 4 tests to confirm that only valid users can be subscribed.

```bash
bundle exec rspec
```

## Overview

![Home Page](https://user-images.githubusercontent.com/682507/116381788-825f5f00-a815-11eb-9d4f-7851e043e8bf.png)

In this view, any customer will be able to subscribe by choosing at least one preference from the checkbox.
After this step, an email will be sent confirming their subscription to the newsletter.

## Possible failures

For email validation we are using [Abstract API](https://app.abstractapi.com/api/email-validation/tester), but the API Key only works for 100 reviews.
So, in case of empty validations please [create an account](https://app.abstractapi.com/users/signup) and generate a new API Key.
Then go to the following route MicoletChallenge/app/models/user.rb line 17 and change the variable *apikey* for the new API created.


## Contribution

This project has been developed by [Jose Alpaca](https://github.com/josejose93), [Eduardo Salinas](https://github.com/eduardo4394) and [Renato Alvarado](https://github.com/Renato0496)

