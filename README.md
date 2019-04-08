# makersbnb

https://github.com/makersacademy/course/blob/master/makersbnb/specification_and_mockups.md

Branching Instructions
We decided to use branching to manage the development workflow and keep the 'master' branch clean. The 'master' branch is treated as the code ready to be shipped out to the end-client, because of this, any new features or code development should not be conducted directly from the 'master' branch, but feature branches are created to manage the features.

Scenario: Say if we wanted to work on a new feature, a new feature branch is created.

Create a new branch: git checkout -b [name_of_your_new_branch]
e.g. git checkout -b login-functionality

When you want to write code for the login-functionality, you will first need to checkout onto that branch (ensure you are on the correct feature branch while coding.
git checkout login-functionality

Any new code will then have to be pushed onto the feature branch (and not directly into master).
git push origin login-functionality

Once you are happy, you are ready to submit a pull request. This will enable others to review and give a thumbs up for the branch to be merged into master.

Once approved, the feature branch (containing the code for the new feature) will be merged into master and available.

Others in the team can then do git pull to get all the new changes

User Stories
As a user, So that I can access the service, I can sign up

As a logged in user, So that I can offer my properties for rent I can list new spaces

As a user with a listed space, So that others can see its availability, I can offer a range of dates

As a logged in user, So that I can hire a space, I can request to book a night

As a user with a listed space, So that I can manage my bookings, I can approve booking requests

## Database Setup Instructions

### Creating makersbnb database

We will need to setup two databases.

To create a test database in psql:

`CREATE DATABASE makersbnb_test;`

To create the main database in psql:

`CREATE DATABASE makersbnb;`

1. Connect to psql in terminal `psql postgres`
2. Enter `CREATE DATABASE makersbnb_test;` command to create a new database called makersbnb_test, do the same command for the makersbnb database.

### Creating spaces table on the makersbnb database

1. Enter `\c makersbnb;` to connect to the database
2. Create `spaces` table by running the sql script `02_create_spaces_table.sql`
3. Run in pSQL by doing `\i db/migrations/02_create_spaces_table.sql` from the root directory of the repository

### Creating a test database

1. Enter `psql` to connect to the database server
2. `CREATE DATABASE "makersbnb_test";` will create a test database
3. Run the SQL script `\i db/migrations/02_create_spaces_table.sql` to create an empty spaces table in the test database
4. Ensure you include `ENV['ENVIRONMENT'] = 'test'` in your `spec_helper.rb` file and check that the bookmark class is pointing to the correct database (this should already be setup in our repository)

```ruby

# Set to test environment
ENV['ENVIRONMENT'] = 'test'

# Configuration of test db
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end


```



