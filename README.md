# Reddit Challenge

[A reddit user on /r/cscareerquestions](https://www.reddit.com/r/cscareerquestions/comments/1cp18i6/comment/l3hz9w9/) was describing an interview take-home test and was saying it would take 20h. I disagreed and thought it was 2-3
hours at most if I did it in Rails. I wanted to put my time where my mouth was and actually try doing it.

STARTED: 10:38 AM ET
END TIME: 11:44 AM ET

DURATION: 1h 6m

Here was the stream of me building the app: https://youtu.be/8VnAMofSCLc

Per the user's comment, the application needs to:

- [x] Provide a user input form with the following fields:
  - [x] First Name
  - [x] Middle Initial
  - [x] Last Name
  - [x] Phone Number (Optional & Must be formatted in format: XXX.XXX.XXXX)
  - [x] Email Address (Optional & Must be valid email address)
  - [x] Single Line Address

- [x] Both the frontend and the backend must perform form validation. The following rules must be applied:
  - [x] First Name is required
  - [x] Phone Number must be in the format: XXX.XXX.XXXX
  - [x] Email Address must be in a valid email format

- [x] Application must showcase basic CRUD operations

- [x] Application must provide data storage using a database solution of your choice

- [x] Application must show a list view of all records
  - [x] Showing an item display (single entry) is a big bonus…but not required.

- [x] Backend application must perform basic unit tests
  - [x] Example: Unit test for form validation <-- this isn't a unit test but OK

# Rails setup

Here was the config settings I used when creating it.

```
rails new redditchallenge --skip-docker --skip-action-mailer --skip-active-job --skip-test -d postgresql -c sass
rails db:create                                   # initialize DB
rails db:migrate                                  # initial migrations
```

-J = skip JS frameworks / webpacker
-d = use database engine that isn't SQLite3

## CSS

Copying Tania Rascia's Primitive UI SCSS source https://taniarascia.github.io/primitive/

```
bin/rails dartsass:install
cp ~/Code/primitive-ui-source/* app/assets/stylesheets/
mv app/assets/stylesheets/main.scss app/assets/stylesheets/application.scss
rm app/assets/stylesheets/application.css # unnecessary now
```

## RSpec

```
bundle add rspec-rails guard-rspec
bundle exec rspec --init
bin/rails g rspec:install
```
