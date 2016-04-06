## Readme

This application simulates one of Credible Labs main flows, Borrower Prequalification. It consists of a form to collect basic Borrower and Loan information that when submitted generates a list of Loan Products that the Borrower is eligible for on the different Lenders on the platform.

It is a monolitic Ruby on Rails app, exposing a Restful + JSON API (without authentication) to a Backbone.js application. Assets processing for the frontend is done via Sprockets and server using embedded http server.

Keep in mind that this is intentionally a barebones app, so do not take it as a representation of how we run our production application at Credible :-) Fell free to mention anything you fell is wrong on the app.

## Assignment

We want to evaluate mainly your front end skills, but also how you interact with the simple restful api of this app and the underling database schema. Your assignment is to improve the UI/UX of the Submission Dashboard page (the page that displays the offers after you submit the form). What improving the UI/UX means is completely up to you, but we expect it to be a better experience than what the initial implementation provides.

Things we would like to see improved compared to the baseline:
- Styling of the elements on the page;
- How information is displayed and organized;
- How the user interacts with the page.

Example of features to add to the experience (we don't expect all of those - pick one or two, up to you):
- Sorting and filtering by the different attributes of the offers;
- Allowing the user to select some of the offers for comparison;
- Some sort of data visualization (charts?);
- Present the user with a subset of the offers (best offers?) with the ability to access the full list;

Nice to have things would include:
- Rework the frontend in Marionette.js;
- Use of animations and transitions;

Regarding basic interaction with the API and DB schema, we would like to display more information about the Lender of each product shown on that page, like name and maybe description.

We will of course also evaluate the quality of your final code.

### Requirements

- ruby 2.3.0
- bundler
- rails 4.2.5
- postgresql

### Setup

- clone this project
- ```bin/bundle install```
- ```bin/rake db:setup``` (or db:create, db:migrate, db:seed)
- ```bin/rails s```
- http://localhost:3000

### Heroku deployment

Need heroku toolbelt to be installed and configured.

- ```heroku create <appname>```
- ```git push heroku```
- ```heroku run rake db:migrate```
- ```heroku run rake db:seed```
- ```heroku open```
