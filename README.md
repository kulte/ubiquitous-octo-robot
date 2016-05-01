## README

This README documents what steps are necessary to get the application up and
running.

### Ruby version

`ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]`

*Note: The application should run with other, earlier versions of Ruby as well.*

### System dependencies

* sqlite
* ruby

### Database creation

Run `rails db:setup` from Terminal to create the database and load the schema.
(use rails db:reset to also drop the db first).

### Running instructions

Run `rails server` from Terminal to run the application in development. This
will serve the application at `localhost:3000`.
